{ config, pkgs, const, lib, ... } : let
  dotfiles = "${config.home.homeDirectory}/${const.dotfiles}";

  # Based from https://github.com/LazyVim/LazyVim/discussions/1972
  mkEntryFromDrv = drv:
    if lib.isDerivation drv then { name = "${lib.getName drv}"; path = drv; }
    else drv;

  lazy = pkgs.linkFarm "lazy-plugins" (builtins.map mkEntryFromDrv plugins);

  plugins = with pkgs.vimPlugins; [
    lazy-nvim
    { name = "mini.pairs"; path = mini-nvim; }
  ];
in {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraLuaConfig = ''
      vim.opt.rtp:prepend("${lazy}/lazy.nvim")

      require("lazy").setup(
        { import = "plugins" },
        {
          dev = {
            path = "${lazy}",
            patterns = { "" },
            fallback = false,
          },
          install = { missing = false },
        }
      )
    '';
  };



  xdg.configFile."nvim/lua".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/user/neovim/config/lua";
  xdg.configFile."nvim/lazypath".text = "${lazy}";
}

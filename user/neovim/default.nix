# This neovim user module is loosely based on https://github.com/LazyVim/LazyVim/discussions/1972.
{ config, pkgs, const, lib, ... } : let
  dotfiles = "${config.home.homeDirectory}/${const.dotfiles}";

  # Compute lazypath.
  lazypath = import ./lazy.nix { inherit lib pkgs; };
in {
  programs.neovim = {
    enable = true;
    defaultEditor = true;

    # Create a nix-compatible entry point.
    extraLuaConfig = ''
      vim.opt.rtp:prepend("${lazypath}/lazy.nvim")

      local opts = {}

      -- Make plugin installation handled by nix.
      opts.dev = {
        path = "${lazypath}",
        -- Match all. This ensures all plugins are sourced from opts.dev.path.
        patterns = { "" },
      }

      opts.install = { missing = false }

      require("custom.options")
      require("custom.keybinds")
      require("lazy").setup(
        { import = "custom.plugins" },
        opts
      )
    '';
  };



  # Symlink the configuration folder, excluding init.lua
  xdg.configFile."nvim/lua".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/user/neovim/config/lua";
  # Symlink lazypath to $XDG_DATA_HOME/nvim/lazy recursively to mimic a normal lazy installation
  xdg.dataFile."nvim/lazy".source = lazypath;
  xdg.dataFile."nvim/lazy".recursive = true;
  # Symlink lazypath to $XDG_DATA_HOME/nvim/lazy-plugins for debugging purposes;
  xdg.dataFile."nvim/lazy-plugins".source = lazypath;
}

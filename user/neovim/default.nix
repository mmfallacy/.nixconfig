{ config, const, ... } : let
  dotfiles = "${config.home.homeDirectory}/${const.dotfiles}";
in {
  programs.neovim = {
    enable = true;
    defaultEditor = true;
  };

  xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink "${dotfiles}/user/neovim/config";
}

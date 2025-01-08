inputs @ { pkgs, ... } : let
  const = import ./const.nix;
  modules.user = import ../../user inputs;
  inherit (const) username;
in {
  _module.args = { inherit const; };

  imports = [
    modules.user.git
    modules.user.shell.zsh
    modules.user.shell.starship
    modules.user.neovim
  ];

  home.username = username;
  home.homeDirectory = "/home/" + username;
  home.packages = with pkgs; [ neofetch ];
  home.stateVersion = "24.11";
}

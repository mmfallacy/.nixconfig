inputs @ { pkgs, ... } : let
  const = import ./const.nix;
  modules.user = import ../../user inputs;
  inherit (const) username;
in {
  _module.args = { inherit const; };

  imports = [
    modules.user.git
    modules.user.zsh
  ];

  home.username = username;
  home.homeDirectory = "/home/" + username;
  home.packages = with pkgs; [ neofetch ];
  home.stateVersion = "24.11";
}

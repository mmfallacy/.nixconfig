inputs @ { pkgs, ... } : let
  const = import ./const.nix;
  modules.user = import ../../user inputs;
  inherit (const) username;
in {
  imports = [
    modules.user.git
  ];

  home.username = username;
  home.homeDirectory = "/home/" + username;
  home.packages = with pkgs; [ neofetch ];
  home.stateVersion = "24.05";

  _module.args = { inherit const; };
}

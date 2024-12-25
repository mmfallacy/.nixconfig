{ pkgs , ... } : let
  username = "mmfallacy";
in {
  home.username = username;
  home.homeDirectory = "/home/" + username;
  home.packages = with pkgs; [ neofetch ];
  home.stateVersion = "24.05";
}

{ pkgs , ... } : {
  home.packages = with pkgs; [ neofetch ];
  home.stateVersion = "24.05";
}

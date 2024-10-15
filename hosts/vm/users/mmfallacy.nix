{pkgs, ...} @ inputs: {
  home.packages = with pkgs; [kitty];
  home.stateVersion = "24.05";
}

{ extras, pkgs, ... }:
{
  home.packages = with pkgs; [
    tldr
  ];
}

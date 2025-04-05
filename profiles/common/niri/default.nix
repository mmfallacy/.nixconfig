# This user module assumes niri.homeModules.config is already imported by configuration.nix thru niri.nixosModules.niri
# At the moment, this user module is intended to be used only by machines and their entry-point home.nix.
# This module is not yet made for home-manager-only use cases.
{ lib, pkgs, ... }:
{
  # programs.niri.enable = true; should be enabled by configuration.nix
  imports = [
    ./startup.nix
    ./binds.nix
    ./appearance.nix
  ];

  home.packages = with pkgs; [
    xwayland-satellite
  ];

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gnome
      xdg-desktop-portal-gtk
    ];
  };
}

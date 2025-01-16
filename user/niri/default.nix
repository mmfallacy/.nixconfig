# This user module assumes niri.homeModules.config is already imported by configuration.nix thru niri.nixosModules.niri
# At the moment, this user module is intended to be used only by machines and their entry-point home.nix.
# This module is not yet made for home-manager-only use cases.
{ lib, pkgs, ... }:
let
in
{
  # programs.niri.enable = true; should be enabled by configuration.nix

  programs.niri.settings = {
    spawn-at-startup = [
      {
        # Spawn default terminal or kitty on startup.
        command = [ "kitty" ];
      }
    ];
  };

  home.packages = [ pkgs.kitty ];
}

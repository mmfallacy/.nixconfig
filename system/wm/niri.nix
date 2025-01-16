{ extras, ... }:
{
  nixpkgs.overlays = [ extras.niri.overlays.niri ];

  imports = [
    extras.niri.nixosModules.niri
  ];

  programs.niri.enable = true;

}

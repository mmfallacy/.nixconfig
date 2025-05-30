{ extras, ... }:
{
  nixpkgs.overlays = [ extras.niri.overlays.niri ];

  imports = [
    extras.niri.nixosModules.niri
  ];

  programs.niri.enable = true;

  # Use sodiboo's binary cache for niri. This is by default
  niri-flake.cache.enable = true;

}

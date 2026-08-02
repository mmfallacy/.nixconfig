{
  flake.nixosMachineModules.minima =
    { lib, extras, ... }:
    {
      custom.quickenable.system.modules = [
        "core"
        "nix"
        "niri"
        "locale-en-PH"
        "weston"
        "nh"
        "ly"
        "clipsync"
      ];

      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;
      virtualisation.hypervGuest.enable = true;

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      system.stateVersion = "25.05";

      programs.hyprland.enable = true;
      programs.hyprland.withUWSM = true;
    };
}

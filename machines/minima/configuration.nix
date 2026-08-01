{
  flake.nixosMachineModules.minima =
    { lib, ... }:
    {
      custom.quickenable.system.modules = [
        "core"
        "nix"
        "niri"
        "locale-en-PH"
        "weston"
        "nh"
        "ly"
      ];

      environment.systemPackages = [
      ];

      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;
      virtualisation.hypervGuest.enable = true;

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      system.stateVersion = "25.05";

    };
}

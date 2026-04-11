{
  flake.nixosMachineModules.minima =
    { lib, ... }:
    {
      custom.quickenable.system.modules = [
        "core"
        "nix"
        "grub"
        "noctalia"
        "niri"
        "locale-en-PH"
        "weston"
        "nh"
        "ly"
      ];

      environment.systemPackages = [
      ];

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      system.stateVersion = "25.05";

    };
}

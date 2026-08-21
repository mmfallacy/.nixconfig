{
  flake.nixosMachineModules.minima-base =
    { lib, ... }:
    {
      custom.quickenable.system.modules = [
        "core"
        "nix"
        "niri"
        "mango"
        "locale-en-PH"
        "weston"
        "nh"
        "ly"
        "clipsync"
      ];

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      system.stateVersion = "25.05";
    };
}

{
  flake.nixosMachineModules.mnemon-base =
    { lib, ... }:
    {
      custom.quickenable.system.modules = [
        "core"
        "nix"
        "mango"
	"systemd-boot"
        "locale-en-PH"
        "weston"
        "nh"
        "ly"
        "clipsync"
      ];

      services.openssh = {
        enable = true;
        openFirewall = true;
      };

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      system.stateVersion = "25.05";
    };
}

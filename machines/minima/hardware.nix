{
  flake.nixosMachineModules.minima =
    { lib, ... }:
    {
      imports = [ ];

      boot.kernelParams = [
        "video=Virtual-1:2560x1440"
      ];
      boot.initrd.availableKernelModules = [
        "sd_mod"
        "sr_mod"
      ];
      boot.initrd.kernelModules = [ ];
      boot.kernelModules = [ ];
      boot.extraModulePackages = [ ];

      fileSystems."/" = {
        device = "/dev/disk/by-uuid/0c35b422-f82f-46b6-9871-f738d112a74d";
        fsType = "ext4";
      };

      fileSystems."/boot" = {
        device = "/dev/disk/by-uuid/B4FB-B371";
        fsType = "vfat";
        options = [
          "fmask=0077"
          "dmask=0077"
        ];
      };

      swapDevices = [ ];

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
    };
}

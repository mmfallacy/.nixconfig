{
  flake.nixosModules.grub =
    { config, ... }:
    {
      boot.loader.grub.enable = true;
      boot.loader.grub.device = "/dev/sda";
      boot.loader.grub.useOSProber = true;

      assertions = [
        {
          assertion = !config.boot.loader.systemd-boot.enable;
          message = "grub conflicts with systemd-boot";
        }
      ];
    };
}

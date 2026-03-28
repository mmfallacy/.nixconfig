{
  flake.nixosModules.systemd-boot =
    {
      config,
      lib,
      ...
    }:
    {
      options.custom.system.systemd-boot.enable = lib.mkEnableOption "system.systemd-boot";

      config = lib.mkIf config.custom.system.systemd-boot.enable {
        boot.loader.grub.enable = true;
        boot.loader.grub.device = "/dev/sda";
        boot.loader.grub.useOSProber = true;

        assertions = [
          {
            assertion = !config.custom.system.grub.enable;
            message = "systemd-boot conflicts with grub";
          }
        ];
      };
    };
}

{
  flake.nixosModules.grub =
    {
      config,
      lib,
      ...
    }:
    {
      options.custom.system.grub.enable = lib.mkEnableOption "system.grub";

      config = lib.mkIf config.custom.system.grub.enable {
        boot.loader.grub.enable = true;
        boot.loader.grub.device = "/dev/sda";
        boot.loader.grub.useOSProber = true;

        assertions = [
          {
            assertion = !config.custom.system.systemd-boot.enable;
            message = "grub conflicts with systemd-boot";
          }
        ];
      };
    };
}

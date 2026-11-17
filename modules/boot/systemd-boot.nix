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
	  boot.loader.systemd-boot.enable = true;
	  boot.loader.efi.canTouchEfiVariables = true;

        assertions = [
          {
            assertion = !config.custom.system.grub.enable;
            message = "systemd-boot conflicts with grub";
          }
        ];
      };
    };
}

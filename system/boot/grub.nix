{ config, pkg, lib, ... }:
let
  PROGRAM = "grub";
in {
  options.modules.${PROGRAM}.enable = lib.mkEnableOption PROGRAM;

  config = lib.mkIf config.modules.${PROGRAM}.enable {
    boot.loader.grub.enable = true;
    boot.loader.grub.device = "/dev/sda";
    boot.loader.grub.useOSProber = true;
  };
}

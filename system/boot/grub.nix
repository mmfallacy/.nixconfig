{ config, pkg, lib, ... }:
let
  PROGRAM = "grub";
  cfg = {
    boot.loader.grub.enable = true;
    boot.loader.grub.device = "/dev/sda";
    boot.loader.grub.useOSProber = true;
  };
in {
  options.sysmodules.${PROGRAM}.enable = lib.mkEnableOption PROGRAM;
  config = lib.mkIf config.sysmodules.${PROGRAM}.enable cfg;
}

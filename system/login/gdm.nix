
{ config, pkg, lib, ... }:
let
  PROGRAM = "gdm";
in {
  options.sysmodules.${PROGRAM}.enable = lib.mkEnableOption PROGRAM;

  config = lib.mkIf config.sysmodules.${PROGRAM}.enable {
    # Display Manager (Login)
    services.xserver.displayManager.gdm.enable = true;
  };
}

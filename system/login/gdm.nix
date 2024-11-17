
{ config, pkg, lib, ... }:
let
  PROGRAM = "gdm";
  cfg = {
    # Display Manager (Login)
    services.xserver.displayManager.gdm.enable = true;
  };
in {
  options.sysmodules.${PROGRAM}.enable = lib.mkEnableOption PROGRAM;
  config = lib.mkIf config.sysmodules.${PROGRAM}.enable cfg;
}

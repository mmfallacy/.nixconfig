
{ config, pkg, lib, ... }:
let
  PROGRAM = "gdm";
in {
  options.modules.${PROGRAM}.enable = lib.mkEnableOption PROGRAM;

  config = lib.mkIf config.modules.${PROGRAM}.enable {
    # Display Manager (Login)
    services.xserver.displayManager.gdm.enable = true;
  };
}

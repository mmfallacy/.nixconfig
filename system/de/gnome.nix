{ config, pkg, lib, ... }:
let
  PROGRAM = "gnome";
in {
  options.sysmodules.${PROGRAM}.enable = lib.mkEnableOption PROGRAM;

  config = lib.mkIf config.sysmodules.${PROGRAM}.enable {
    # Desktop Environment
    services.xserver.enable = true;
    services.xserver.desktopManager.gnome.enable = true;
    services.xserver.xkb = { layout = "us"; variant = ""; };
  };
}

{ config, pkg, lib, ... }:
let
  PROGRAM = "gnome";
in {
  options.modules.${PROGRAM}.enable = lib.mkEnableOption PROGRAM;

  config = lib.mkIf config.modules.${PROGRAM}.enable {
    # Desktop Environment
    services.xserver.enable = true;
    services.xserver.desktopManager.gnome.enable = true;
    services.xserver.xkb = { layout = "us"; variant = ""; };
  };
}

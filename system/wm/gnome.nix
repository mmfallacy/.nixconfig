{ ... } : {
  # Desktop Environment
  services.xserver.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.xkb = { layout = "us"; variant = ""; };
}

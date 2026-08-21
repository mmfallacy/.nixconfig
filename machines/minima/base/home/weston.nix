{
  flake.hjemConfigs.minima-base =
    { lib, ... }:
    {
      custom.home.niri.enable = true;
      xdg.config.files."weston.ini".text = lib.mkDefault ''
        [output]
        name=Virtual-1
        mode=1920x1080@60
      '';
    };
}

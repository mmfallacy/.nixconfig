{
  flake.hjemConfigs.minima-weston =
    { lib, ... }:
    {
      custom.home.niri.enable = true;
      xdg.config.files."weston.ini".text = ''
        [output]
        name=Virtual-1
        mode=2560x1440@60
      '';
    };
}

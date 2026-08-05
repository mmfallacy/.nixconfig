{
  flake.hjemConfigs.minima-weston =
    { lib, ... }:
    {
      custom.home.niri.enable = true;
      xdg.config.files."weston.ini".text = ''
        [output]
        name=Virtual-1
	mode=1920x1080@60
      '';
    };
}

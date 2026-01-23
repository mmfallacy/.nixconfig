{ config, pkgs, ... }:
{
  # Disable title-bars
  programs.niri.settings.prefer-no-csd = true;

  # Set layout settings
  programs.niri.settings.layout = {
    gaps = 4;
    border.width = 2;
    always-center-single-column = true;
  };

  # Set window rules
  programs.niri.settings.window-rules = [
    # Default window rules
    {
      # geometry-corner-radius accepts type null or submodule.
      geometry-corner-radius =
        let
          r = 8.0;
        in
        {
          top-left = r;
          top-right = r;
          bottom-left = r;
          bottom-right = r;
        };
      clip-to-geometry = true;
      opacity = 0.9;
    }
    {
      matches = [ { app-id = "^kitty$"; } ];
      default-column-width.proportion = 0.45;
    }
  ];

  # Set wallpaper thru swaybg based on what stylix has
  home.packages = [ pkgs.swaybg ];
  programs.niri.settings.spawn-at-startup = [
    (pkgs.lib.mkIf config.stylix.enable {
      command = [
        "swaybg"
        "-i"
        "${config.stylix.image}"
      ];
    })
  ];
}

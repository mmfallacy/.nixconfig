{ ... }:
{
  programs.waybar = {
    enable = true;
    settings.mainBar = {
      layer = "top";
      modules-left = [
        "niri/workspaces"
        # Mode
        # Scratchpad
        # custom/media

      ];
      modules-center = [
        "niri/window"
      ];
      modules-right = [
        "clock"
        "tray"
      ];

      tray = {
        spacing = 10;
      };
      clock = {
        tooltip-format = "<big>{:%Y %B}</big>\n<tt><small>{calendar}</small></tt>";
        format-alt = "{:%Y-%m-%d}";
      };

      "niri/workspaces" = {
        all-outputs = true;
      };
    };
  };
}

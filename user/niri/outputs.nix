{ ... }:
{
  programs.niri.settings.outputs = {
    "Virtual-1" = {
      enable = true;
      mode.width = 4096;
      mode.height = 2160;
      scale = 2;
    };
  };
}

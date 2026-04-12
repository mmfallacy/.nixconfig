{
  flake.hjemModules.omniwm =
    { config, lib, ... }:
    {
      config = lib.mkIf config.custom.home.omniwm.enable {
        xdg.config.files."omniwm/settings.json".value = {
          quakeTerminalEnabled = false;
          quakeTerminalAnimationDuration = 0.2;
          quakeTerminalAutoHide = false;
          quakeTerminalHeightPercent = 50;
          quakeTerminalMonitorMode = "focusedWindow";
          quakeTerminalOpacity = 1;
          quakeTerminalPosition = "center";
          quakeTerminalUseCustomFrame = false;
          quakeTerminalWidthPercent = 50;
        };
      };
    };
}

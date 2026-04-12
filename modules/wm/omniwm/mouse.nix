{
  flake.hjemModules.omniwm =
    { config, lib, ... }:
    {
      config = lib.mkIf config.custom.home.omniwm.enable {
        xdg.config.files."omniwm/settings.json".value = {
          # Focus behaviour
          focusFollowsMouse = false;
          focusFollowsWindowToMonitor = false;
          moveMouseToFocusedWindow = false;

          # Mouse warp between monitors
          mouseWarpAxis = "horizontal";
          mouseWarpMargin = 1;
          mouseWarpMonitorOrder = [ ];

          # Trackpad gestures (workspace swipe)
          gestureFingerCount = 3;
          gestureInvertDirection = true;

          # Scroll modifier
          scrollGestureEnabled = true;
          scrollModifierKey = "optionShift";
          scrollSensitivity = 5;
        };
      };
    };
}

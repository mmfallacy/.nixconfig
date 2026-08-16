{
  flake.hjemModules.omniwm =
    { config, lib, ... }:
    {
      config = lib.mkIf config.custom.home.omniwm.enable {
        xdg.config.files."omniwm/settings.toml".value = {
          focus = {
            followsMouse = false;
            followsWindowToMonitor = false;
            moveMouseToFocusedWindow = false;
          };

          mouseWarp.margin = 1;

          gesture = {
            fingerCount = 3;
            invertDirection = true;
            mouseMoveModifierKey = "option";
            mouseResizeModifierKey = "option";
            scrollEnabled = true;
            scrollModifierKey = "optionShift";
            scrollSensitivity = 5.0;
            trackpadScrollStyle = "snap";
            workspaceSwipeAxis = "vertical";
            workspaceSwipeEnabled = false;
            workspaceSwipeFingerCount = 3;
          };
        };
      };
    };
}

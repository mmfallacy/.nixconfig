{
  flake.hjemModules.omniwm =
    { config, lib, ... }:
    {
      config = lib.mkIf config.custom.home.omniwm.enable {
        xdg.config.files."omniwm/settings.json".value = {
          defaultLayoutType = "niri";

          # Niri layout
          niriAlwaysCenterSingleColumn = true;
          niriCenterFocusedColumn = "never";
          niriColumnWidthPresets = [
            0.3333333333333333
            0.5
            0.66
          ];
          niriInfiniteLoop = true;
          niriMaxVisibleColumns = 2;
          niriMaxWindowsPerColumn = 3;
          niriSingleWindowAspectRatio = "4:3";

          monitorNiriSettings = [ ];
          monitorOrientationSettings = [ ];
        };
      };
    };
}

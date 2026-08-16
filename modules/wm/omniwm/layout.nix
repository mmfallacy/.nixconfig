{
  flake.hjemModules.omniwm =
    { config, lib, ... }:
    {
      config = lib.mkIf config.custom.home.omniwm.enable {
        xdg.config.files."omniwm/settings.toml".value = {
          general.defaultLayoutType = "niri";

          # Niri layout
          niri = {
            alwaysCenterSingleColumn = true;
            centerFocusedColumn = "never";
            containerPrimarySpanPresets = [
              0.3333333333333333
              0.5
              0.66
            ];
            infiniteLoop = true;
            visibleContainerCount = 2;
            singleWindowFit = "1440x1080";
          };

          monitorNiriOverrides = [ ];
          monitorOrientationOverrides = [ ];
        };
      };
    };
}

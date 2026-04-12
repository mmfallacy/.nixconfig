{
  flake.hjemModules.omniwm =
    { config, lib, ... }:
    {
      config = lib.mkIf config.custom.home.omniwm.enable {
        xdg.config.files."omniwm/settings.json".value = {
          animationsEnabled = true;
          appearanceMode = "automatic";

          bordersEnabled = true;
          borderWidth = 3;
          borderColorAlpha = 1;
          borderColorRed = 0.029246121644973755;
          borderColorGreen = 0.8049586415290833;
          borderColorBlue = 0.7683688998222351;

          gapSize = 4;
          outerGapTop = 4;
          outerGapBottom = 4;
          outerGapLeft = 4;
          outerGapRight = 4;
        };
      };
    };
}

{
  flake.hjemModules.omniwm =
    { config, lib, ... }:
    {
      config = lib.mkIf config.custom.home.omniwm.enable {
        xdg.config.files."omniwm/settings.toml".value = {
          general.animationsEnabled = true;

          appearance.mode = "automatic";

          borders = {
            enabled = true;
            width = 3;
            color = {
              alpha = 1;
              red = 0.029246121644973755;
              green = 0.8049586415290833;
              blue = 0.7683688998222351;
            };
          };

          gaps = {
            size = 6;
            outer = {
              top = 0;
              bottom = 0;
              left = 0;
              right = 0;
            };
          };
        };
      };
    };
}

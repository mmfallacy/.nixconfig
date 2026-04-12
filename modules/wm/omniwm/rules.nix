{
  flake.hjemModules.omniwm =
    { config, lib, ... }:
    {
      config = lib.mkIf config.custom.home.omniwm.enable {
        xdg.config.files."omniwm/settings.json".value = {
          appRules = [
            {
              bundleId = "com.clickup.desktop-app";
              id = "A5AB6C8A-BE53-4EB8-9ABC-EB81D8EE147C";
              assignToWorkspace = "9";
            }
            {
              bundleId = "com.tinyspeck.slackmacgap";
              id = "0FF5E590-D317-49BB-943B-C2905F43D948";
              assignToWorkspace = "9";
            }
          ];
        };
      };
    };
}

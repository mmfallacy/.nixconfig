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
            {
              bundleId = "com.1password.1password";
              id = "6790050D-888B-4401-AA43-55386E4C0F8F";
              layout = "float";
            }
            {
              bundleId = "com.apple.iphonesimulator";
              id = "443C1A29-119D-42EC-99BE-20B2E2025822";
              layout = "tile";
            }
          ];
        };
      };
    };
}

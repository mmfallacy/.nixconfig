{
  flake.nixosModules.locale_en_PH =
    {
      config,
      lib,
      ...
    }:
    {
      options.custom.system.locale-en-PH.enable = lib.mkEnableOption "system.locale-en-PH";

      config = lib.mkIf config.custom.system.locale-en-PH.enable {
        i18n.defaultLocale = "en_PH.UTF-8";
        i18n.extraLocaleSettings = {
          LC_ADDRESS = "fil_PH";
          LC_IDENTIFICATION = "fil_PH";
          LC_MEASUREMENT = "fil_PH";
          LC_MONETARY = "fil_PH";
          LC_NAME = "fil_PH";
          LC_NUMERIC = "fil_PH";
          LC_PAPER = "fil_PH";
          LC_TELEPHONE = "fil_PH";
          LC_TIME = "fil_PH";
        };
      };
    };
}

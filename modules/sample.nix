{
  flake.nixosModules.sample =
    {
      config,
      lib,
      ...
    }:
    {
      options.custom.system.sample.enable = lib.mkEnableOption "system.sample";

      config = lib.mkIf config.custom.system.sample.enable {
      };
    };

  flake.hjemModules.sample =
    {
      config,
      lib,
      ...
    }:
    {
      options.custom.home.sample.enable = lib.mkEnableOption "home.sample";

      config = lib.mkIf config.custom.home.sample.enable {
      };
    };
}

{
  flake.nixosModules.mango =
    {
      config,
      lib,
      extras,
      ...
    }:
    {
      options.custom.system.mango.enable = lib.mkEnableOption "system.mango";

      imports = [
        extras.mango.nixosModules.mango
      ];

      config = lib.mkIf config.custom.system.niri.enable {
        programs.mango.enable = true;
      };

    };

  flake.hjemModules.mango =
    {
      config,
      lib,
      ...
    }:
    {
      options.custom.home.mango.enable = lib.mkEnableOption "home.mango";

      config = lib.mkIf config.custom.home.mango.enable {
      };
    };
}

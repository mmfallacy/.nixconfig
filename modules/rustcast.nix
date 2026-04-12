{
  flake.darwinModules.rustcast =
    {
      config,
      lib,
      extras,
      ...
    }:
    {
      options.custom.system.rustcast.enable = lib.mkEnableOption "system.rustcast";

      config = lib.mkIf config.custom.system.rustcast.enable {
        environment.systemPackages = [
          extras.mypkgs.rustcast
        ];
      };
    };

}

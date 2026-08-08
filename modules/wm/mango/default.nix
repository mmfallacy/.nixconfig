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

        programs.mango.addLoginEntry = false;

        programs.uwsm.waylandCompositors = {
          mango = {
            prettyName = "Mango";
            comment = "Mango compositor managed by UWSM";
            binPath = "/run/current-system/sw/bin/mango";
          };
        };
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
        xdg.config.files."mango/config.conf".text = ''
          source=./binds.conf
          source=./appearance.conf
          source=./animations.conf
          source=./layout.conf
        '';
      };
    };
}

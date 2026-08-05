{
  flake.nixosModules.mango =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      options.custom.system.mango.enable = lib.mkEnableOption "system.mango";

      config = lib.mkIf config.custom.system.niri.enable {
        # default config isn't copied from pkgs.mango for some reason

        environment.etc."mango/config.conf".source = "${pkgs.mangowc}/etc/mango/config.conf";
      };

    };

}

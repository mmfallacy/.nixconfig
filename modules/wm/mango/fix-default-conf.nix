{
  flake.nixosModules.mango =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      config = lib.mkIf config.custom.system.mango.enable {
        # default config isn't copied from pkgs.mango for some reason

        environment.etc."mango/config.conf".source = "${pkgs.mangowc}/etc/mango/config.conf";
      };

    };

}

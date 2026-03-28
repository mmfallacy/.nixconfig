{
  flake.nixosModules.nh =
    {
      config,
      lib,
      extras,
      ...
    }:
    {
      options.custom.system.nh.enable = lib.mkEnableOption "system.nh";

      config = lib.mkIf config.custom.system.nh.enable {
        programs.nh = {
          enable = true;

          clean.enable = true;
          clean.extraArgs = "--keep 3";

          # NOTE: nh does not propagate home-manager activation errors
          # https://github.com/nix-community/nh/issues/388
          package = extras.nh;
        };
      };
    };
}

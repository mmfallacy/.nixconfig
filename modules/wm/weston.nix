{
  flake.nixosModules.weston =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      options.custom.system.weston.enable = lib.mkEnableOption "system.weston";

      config = lib.mkIf config.custom.system.weston.enable {
        # Desktop Environment
        environment.systemPackages = [
          pkgs.weston
        ];

        # Register to display managers
        services.displayManager.sessionPackages = [
          pkgs.weston
        ];
      };
    };
}

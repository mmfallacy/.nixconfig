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

  flake.hjemModules.kitty =
    {
      osConfig,
      lib,
      pkgs,
      ...
    }:
    let
      icon =
        pkgs.runCommand "kitty-icon-32.png"
          {
            nativeBuildInputs = [ pkgs.imagemagick ];
          }
          ''
            magick ${pkgs.kitty}/share/icons/hicolor/256x256/apps/kitty.png -resize 32x32 $out
          '';
    in
    {
      # Use kitty as default shell
      config = lib.mkIf osConfig.custom.system.weston.enable {
        xdg.config.files."weston.ini" = {
          generator = lib.generators.toINI { };
          value = {
            launcher = {
              icon = icon;
              path = "${lib.getExe pkgs.kitty}";
            };
          };
        };
      };
    };
}

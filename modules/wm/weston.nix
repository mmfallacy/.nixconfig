top: {
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
      config,
      osConfig,
      lib,
      pkgs,
      mylib,
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
      config =
        mylib.mkIfAllTrue
          [
            osConfig.custom.system.weston.enable
            config.custom.home.kitty.enable
          ]
          {
            # Use text for glorious merging until i find a better option to not redeclare generators.
            # github:feel-co/hjem/154
            xdg.config.files."weston.ini".text = ''
              [launcher]
                icon=${icon}
                path=${lib.getExe pkgs.kitty}
            '';
          };
    };
}

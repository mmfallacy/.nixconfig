{
  flake.hjemModules.niri =
    { pkgs, ... }:
    {

      xdg.config.files."niri/config.kdl".text = # kdl
        ''
          prefer-no-csd 
          layout {
            gaps 8
            border {
                width 1
            }
            always-center-single-column
          }

          window-rule {
            geometry-corner-radius 8
            clip-to-geometry true
            opacity 0.9
          }

          window-rule {
            match app-id="^kitty$"
            default-column-width {
              proportion 0.45
            }
          }
        '';
    };
}

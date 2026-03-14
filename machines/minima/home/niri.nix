top: {
  flake.hjemConfigs.minima-niri =
    { pkgs, ... }:
    {
      imports = with top.config.flake.hjemModules; [
        niri
      ];

      xdg.config.files."niri/config.kdl".text = # kdl
        ''
          output "Virtual-1" {
            mode "4096x2160@60"
            scale 1.5
          }
        '';
    };
}

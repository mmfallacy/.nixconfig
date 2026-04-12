{
  flake.hjemConfigs.minima-niri =
    { ... }:
    {
      custom.home.niri.enable = true;
      xdg.config.files."niri/config.kdl".text = # kdl
        ''
          output "Virtual-1" {
            mode "4096x2160@60"
            scale 1.5
          }
        '';
    };
}

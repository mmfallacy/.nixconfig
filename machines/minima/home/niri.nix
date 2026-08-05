{
  flake.hjemConfigs.minima-niri =
    { ... }:
    {
      custom.home.niri.enable = true;
      xdg.config.files."niri/config.kdl".text = # kdl
        ''
          output "Virtual-1" {
            mode "3840x2160@59.940"
            scale 1
          }
        '';
    };
}

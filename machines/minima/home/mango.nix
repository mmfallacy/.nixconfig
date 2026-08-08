{
  flake.hjemConfigs.minima-mango =
    { ... }:
    {
      custom.home.mango.enable = true;
      xdg.config.files."mango/config.conf".text = ''
        source=./outputs.conf
      '';
      xdg.config.files."mango/outputs.conf".text =
        let
          name = "^Virtual-1$";
          width = "1920";
          height = "1080";
          refresh = "60";
          x = "0";
          y = "0";
          scale = "0.75";
          vrr = "0";
          rr = "0";
        in
        ''
          monitorrule=name:${name},width:${width},height:${height},refresh:${refresh},x:${x},y:${y},scale:${scale},vrr:${vrr},rr:${rr}
        '';
    };
}

{
  flake.hjemConfigs.minima-nixos-qemu-wsl =
    { ... }:
    {
      custom.home.mango.enable = true;
      xdg.config.files."mango/config.conf".text = ''
        source=./outputs.conf
      '';
      xdg.config.files."mango/outputs.conf".text =
        let
          name = "^Virtual-1$";
          width = "2556";
          height = "1366";
          refresh = "60";
          x = "0";
          y = "0";
          scale = "1";
          vrr = "0";
          rr = "0";
          custom = "1";
        in
        ''
          monitorrule=name:${name},width:${width},height:${height},refresh:${refresh},x:${x},y:${y},scale:${scale},vrr:${vrr},rr:${rr},custom:${custom}
        '';
      xdg.config.files."mango/binds.conf".text = ''
        # Added for minima-nixos-qemu-wsl
        bind=SUPER,d,spawn,unfocus
      '';

      custom.home.unfocus = {
        enable = true;
        username = "mmfallacy";
        # WSL gateway
        ip = "192.168.122.1";
      };
    };
}

{
  flake.hjemConfigs.minima-nixos-qemu-wsl =
    { ... }:
    {
      custom.home.niri.enable = true;
      xdg.config.files."weston.ini".text = ''
        [output]
        name=Virtual-1
        mode=2566x1366@60
      '';
    };
}

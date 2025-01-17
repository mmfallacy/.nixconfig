{ ... }:
{
  programs.niri.settings.spawn-at-startup = [
    {
      # Spawn default terminal or kitty on startup.
      command = [ "kitty" ];
    }
    {
      command = [ "xwayland-satellite" ];
    }
  ];
}

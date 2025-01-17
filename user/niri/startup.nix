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

  # Disable starting screen hotkey-overlay.
  programs.niri.settings.hotkey-overlay.skip-at-startup = true;
}

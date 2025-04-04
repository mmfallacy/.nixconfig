{ ... }:
{
  programs.niri.settings.spawn-at-startup = [
    {
      # Spawn default terminal or kitty on startup.
      # TODO: This should start default terminal, instead of hardcoded kitty
      command = [ "kitty" ];
    }
    {
      command = [ "xwayland-satellite" ];
    }
  ];
  programs.niri.settings.environment.DISPLAY = ":0";

  # Disable starting screen hotkey-overlay.
  programs.niri.settings.hotkey-overlay.skip-at-startup = true;
}

{
  inputs,
  pkgs,
  ...
}:
{
  imports = [
    ./binds.nix
  ];

  services.aerospace = {
    enable = true;
    settings = {
      gaps.outer = rec {
        left = 8;
        bottom = left;
        top = left;
        right = left;
      };
    };
  };
  system.defaults.dock.autohide = true;
  system.defaults.dock.autohide-delay = 100000.00;
  system.defaults.dock.static-only = true;
  system.defaults.dock.showDesktopGestureEnabled = false;

  system.defaults.WindowManager.EnableStandardClickToShowDesktop = false;
  system.defaults.WindowManager.GloballyEnabled = false;
}

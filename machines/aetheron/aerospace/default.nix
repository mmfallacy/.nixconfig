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
    enable = false;
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
}

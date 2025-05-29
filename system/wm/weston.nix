{ pkgs, ... }:
{
  # Desktop Environment
  environment.systemPackages = [
    pkgs.weston
  ];

  # Register to display managers
  services.displayManager.sessionPackages = [
    pkgs.weston
  ];
}

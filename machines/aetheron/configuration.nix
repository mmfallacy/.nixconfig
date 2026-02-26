{
  inputs,
  pkgs,
  ...
}:
let
  hostname = "aetheron";
  system = "aarch64-darwin";
in
{
  nixpkgs.config.allowUnfree = true;

  nixpkgs.hostPlatform = system;

  security.pam.services.sudo_local.touchIdAuth = true;

  environment.systemPackages = with pkgs; [
    # Add more development tools here!
    inputs.nh.packages.${system}.default
    pkgs.kitty
  ];

  networking.hostName = hostname;
  networking.computerName = hostname;

  system.stateVersion = 6;
  environment.variables = {
    NH_FLAKE = "/Users/mmfallacy/.nixconfig/";
  };
}

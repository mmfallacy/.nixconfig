{
  inputs,
  pkgs,
  extras,
  ...
}:
let
  hostname = "aetheron";
  system = "aarch64-darwin";
  user = "mmfallacy";
in
{
  imports = [
    ./aerospace
  ];

  nixpkgs.config.allowUnfree = true;

  nixpkgs.hostPlatform = system;

  security.pam.services.sudo_local.touchIdAuth = true;

  environment.systemPackages = with pkgs; [
    # Add more development tools here!
    inputs.nh.packages.${system}.default
    pkgs.kitty
    pkgs.podman
    pkgs.podman-compose
  ];

  networking.hostName = hostname;
  networking.computerName = hostname;

  system.primaryUser = user;

  system.stateVersion = 6;
  environment.variables = {
    NH_FLAKE = "/Users/${user}/.nixconfig/";
  };

  nix.optimise.automatic = true;
  nix.settings = {

    # Enable experimental features
    experimental-features = [
      "nix-command"
      "flakes"
      "pipe-operators"
      # "pipe-operator"
    ];

    # Use nix-community cachix by default
    # TODO: Investigate on whether this is a good idea or not.
    substituters = [
      "https://nix-community.cachix.org/"
      "https://cache.nixos.org/"
      # "https://cache.lix.systems"
    ];

    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      # "cache.lix.systems:aBnZUw8zA7H35Cz2RyKFVs3H4PlGTLawyY5KRbvJR8o="
    ];
  };

}

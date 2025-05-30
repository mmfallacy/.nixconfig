{ ... }:
{

  nix.settings = {
    # Optimize symlinks
    auto-optimise-store = true;

    # Enable experimental features
    experimental-features = [
      "nix-command"
      "flakes"
      "pipe-operators"
    ];

    # Use nix-community cachix by default
    # TODO: Investigate on whether this is a good idea or not.
    substituters = [
      "https://nix-community.cachix.org/"
      "https://cache.nixos.org/"
    ];

    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
    ];

  };
}

{ inputs, ... }:
{

  nix.settings = {
    # Optimize symlinks
    auto-optimise-store = true;

    # Enable experimental features
    experimental-features = [
      "nix-command"
      "flakes"
      # "pipe-operators"
      "pipe-operator"
    ];

    # Use nix-community cachix by default
    # TODO: Investigate on whether this is a good idea or not.
    substituters = [
      "https://nix-community.cachix.org/"
      "https://cache.nixos.org/"
      "https://cache.lix.systems"
    ];

    trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "cache.lix.systems:aBnZUw8zA7H35Cz2RyKFVs3H4PlGTLawyY5KRbvJR8o="
    ];

  };

  nix.nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
}

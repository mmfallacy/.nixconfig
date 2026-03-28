{
  flake.nixosModules.nix =
    {
      config,
      lib,
      inputs,
      ...
    }:
    {
      options.custom.system.nix.enable = lib.mkEnableOption "system.nix";

      config = lib.mkIf config.custom.system.nix.enable {
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
          substituters = [
            "https://nix-community.cachix.org/"
            "https://cache.nixos.org/"
          ];

          trusted-public-keys = [
            "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
            "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
          ];

          trusted-users = [ "root" ];
        };

        # Remove NIX_PATH and legacy channels
        nix.nixPath = [
          "nixpkgs=${inputs.nixpkgs}"
        ];
        nix.channel.enable = false;

        system.rebuild.enableNg = true;
      };
    };
}

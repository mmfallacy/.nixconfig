{
  flake.nixosMachineModules.aetheron =
    {
      extras,
      pkgs,
      ...
    }:
    {
      imports = [
        ./aerospace/_default.nix
      ];

      nixpkgs.config.allowUnfree = true;

      security.pam.services.sudo_local.touchIdAuth = true;

      system.stateVersion = 6;

      nix = {
        optimise.automatic = true;
        settings = {
          experimental-features = [
            "nix-command"
            "flakes"
            "pipe-operators"
          ];

          substituters = [
            "https://nix-community.cachix.org/"
            "https://cache.nixos.org/"
          ];

          trusted-public-keys = [
            "nix-community.cachix.org-1:mb9fsh9qf2dcimdsuo8zy7bkq5cx+/rkcwyvrcyg3fs="
          ];

        };
      };

      system.defaults.finder.AppleShowAllFiles = true;
      system.defaults.finder.QuitMenuItem = true;
      system.defaults.finder.ShowPathbar = true;
      system.defaults.finder._FXSortFoldersFirst = true;

      system.defaults.trackpad.Dragging = true;

      environment.systemPackages = with pkgs; [
        extras.nh
        kitty
        podman
        podman-compose
        _1password-cli
        extras.pkgs-unstable.difftastic
      ];

      system.primaryUser = "mmfallacy";
      environment.variables.NH_FLAKE = "/Users/mmfallacy/.nixconfig/";
    };
}

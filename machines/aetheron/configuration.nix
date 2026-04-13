{
  flake.nixosMachineModules.aetheron =
    {
      extras,
      pkgs,
      ...
    }:
    {
      nixpkgs.config.allowUnfree = true;

      security.pam.services.sudo_local.touchIdAuth = true;

      system.stateVersion = 6;

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

      custom.system.omniwm.enable = true;
      custom.system.rustcast.enable = true;
      custom.system.nix.enable = true;
    };
}

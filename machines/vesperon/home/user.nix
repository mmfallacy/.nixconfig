top: {
  flake.nixosMachineModules.vesperon =
    {
      config,
      pkgs,
      extras,
      ...
    }:
    {
      hjem.users.mmfallacy = rec {
        directory = config.users.users.mmfallacy.home;

        environment.sessionVariables = {
          TERMINAL = "kitty";
          FLAKE = "${directory}/.nixconfig";
        };
        imports = with top.config.flake.hjemConfigs; [
          vesperon-niri
        ];

        custom.quickenable.hjem.modules = [
          "noctalia"
          "zsh"
          "git"
          "direnv"
          "starship"
          "fastfetch"
          "hstr"
          "any-nix-shell"
          "eza"
        ];

        packages =
          with pkgs;
          let
            opencode = extras.nixnvim.opencode.override {
              xdgConfig = "${directory}/.nixnvim";
            };
          in
          [
            kitty
            extras.nixnvim.neovim.devMode
            opencode
            extras.flakeup
          ];

        custom.multi-user-git = {
          enable = true;
          users = [
            {
              username = "mmfallacy";
              email = "31348500+mmfallacy@users.noreply.github.com";
              signingKey = "~/.ssh/id_ed25519";
              authKey = "~/.ssh/id_ed25519";
            }
            {
              username = "mmfallacy-extra";
              email = "205347616+mmfallacy-extra@users.noreply.github.com";
              signingKey = "~/.ssh/mmfallacy-extra_ed25519";
              authKey = "~/.ssh/mmfallacy-extra_ed25519";
            }
            {
              username = "ryuuudev";
              email = "211357809+ryuuudev@users.noreply.github.com";
              signingKey = "~/.ssh/ryuuudev_ed25519";
              authKey = "~/.ssh/ryuuudev_ed25519";
            }
          ];
        };

      };

      users.users.mmfallacy = {
        isNormalUser = true;
        description = "Michael M.";
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
        useDefaultShell = true;
      };
    };

}

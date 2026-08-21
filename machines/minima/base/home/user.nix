top: {
  flake.nixosMachineModules.minima-base =
    {
      config,
      ...
    }:
    {
      hjem.users.mmfallacy = rec {
        directory = config.users.users.mmfallacy.home;

        environment.sessionVariables = {
          TERMINAL = "kitty";
          EDITOR = "nvim";
          FLAKE = "${directory}/.nixconfig";
        };

        custom.quickenable.hjem.modules = [
          "zsh"
          "git"
          "direnv"
          "starship"
          "fastfetch"
          "hstr"
          "kitty"
          "any-nix-shell"
          "eza"
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
            # {
            #   username = "mmfallacy-extra";
            #   email = "205347616+mmfallacy-extra@users.noreply.github.com";
            #   signingKey = "~/.ssh/mmfallacy-extra_ed25519";
            #   authKey = "~/.ssh/mmfallacy-extra_ed25519";
            # }
            # {
            #   username = "ryuuudev";
            #   email = "211357809+ryuuudev@users.noreply.github.com";
            #   signingKey = "~/.ssh/ryuuudev_ed25519";
            #   authKey = "~/.ssh/ryuuudev_ed25519";
            # }
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

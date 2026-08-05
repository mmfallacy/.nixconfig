top: {
  flake.nixosMachineModules.minima =
    {
      config,
      pkgs,
      lib,
      extras,
      ...
    }:
    {
      hjem.users.mmfallacy = rec {
        directory = config.users.users.mmfallacy.home;

        environment.sessionVariables = {
          TERMINAL = "kitty";
          FLAKE = "${directory}/.nixconfig-dendritic";
        };
        imports = with top.config.flake.hjemConfigs; [
          minima-weston
        ];

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

        packages = with pkgs; [
          extras.nixnvim.neovim
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

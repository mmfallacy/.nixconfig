top: {
  flake.nixosMachineModules.aetheron =
    {
      config,
      pkgs,
      extras,
      ...
    }:
    {
      system.primaryUser = "mmfallacy";
      hjem.users.mmfallacy = rec {
        directory = config.users.users.mmfallacy.home;

        environment.sessionVariables = {
          TERMINAL = "kitty";
          FLAKE = "${directory}/.nixconfig-dendritic";
        };

        custom.quickenable.hjem.modules = [
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
            nixnvim = extras.nixnvim.neovim;
          in
          [
            kitty
            opencode
            nixnvim
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
          ];
        };

      };

      users.users.mmfallacy = {
        home = "/Users/mmfallacy";
        shell = pkgs.zsh;
      };
    };

}

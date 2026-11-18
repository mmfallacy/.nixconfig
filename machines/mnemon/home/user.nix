top: {
  flake.nixosMachineModules.mnemon-base =
    {
      config,
      extras,
      ...
    }:
    {
      hjem.users.mmfallacy = rec {
        directory = config.users.users.mmfallacy.home;

        imports = [
          top.config.flake.hjemConfigs.mnemon-base
        ];

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
              email = "noreply@mnstrl.xyz";
              signingKey = "~/.ssh/id_ed25519";
              authKey = "~/.ssh/id_ed25519";
            }
          ];
        };

        packages = [ extras.nixnvim.neovim ];

      };

      users.users.mmfallacy = {
        isNormalUser = true;
        description = "Michael M.";
        extraGroups = [
          "networkmanager"
          "wheel"
        ];
        useDefaultShell = true;
        openssh.authorizedKeys.keys = [
          "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIOC03RehgKxsKzFCfNA/QI66HOa62KM1bbyEEwxr/5jt mmfallacy@minima"
        ];
      };
    };

}

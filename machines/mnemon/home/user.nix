top: {
  flake.nixosMachineModules.mnemon-base =
    {
      config,
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

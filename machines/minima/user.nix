top: {
  flake.nixosModules.machine-minima =
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
          FLAKE = "${directory}/.nixconfig-dendritic";
        };
        imports = with top.config.flake.hjemModules; [
          niri
          zsh
          git
          direnv
          starship
          fastfetch
          hstr
          any-nix-shell
          eza
        ];

        packages = with pkgs; [
          kitty
          extras.nixnvim.neovim
        ];
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

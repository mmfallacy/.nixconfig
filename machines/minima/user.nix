top: {
  flake.nixosModules.machine-minima =
    {
      pkgs,
      extras,
      ...
    }:
    {
      hjem.users.mmfallacy = {
        environment.sessionVariables = {
          TERMINAL = "kitty";
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

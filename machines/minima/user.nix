top: {
  flake.nixosModules.machine-minima =
    {
      config,
      lib,
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

      # Temp
      hjem.users.mmfallacy.files.".zshrc".text = ''
        source ${config.hjem.users.mmfallacy.environment.loadEnv}
      '';
    };

}

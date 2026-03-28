{
  flake.nixosModules.noctalia =
    {
      config,
      lib,
      extras,
      ...
    }:
    {
      options.custom.system.noctalia.enable = lib.mkEnableOption "system.noctalia";

      imports = [
        extras.noctalia.nixosModules.default
      ];

      config = lib.mkIf config.custom.system.noctalia.enable {

        services.noctalia-shell.enable = true;

        nix.settings = {
          substituters = [ "https://noctalia.cachix.org" ];
          trusted-public-keys = [
            "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
          ];
          fallback = false;
        };
      };
    };

  flake.hjemModules.noctalia =
    {
      config,
      lib,
      pkgs,
      ...
    }@inputs:
    let
      json = pkgs.formats.json { };
    in
    {
      options.custom.home.noctalia.enable = lib.mkEnableOption "home.noctalia";

      config = lib.mkIf config.custom.home.noctalia.enable {
        xdg.config.files = {
          "noctalia/settings.json" = {
            generator = json.generate "settings.json";
            value = import ./_settings.nix inputs;
          };
        };
      };
    };

  flake.hjemModules.niri =
    {
      config,
      lib,
      ...
    }:
    {
      # Niri integration
      config = lib.mkIf config.custom.home.noctalia.enable {
        xdg.config.files."niri/config.kdl".text = # kdl
          ''
            spawn-at-startup "noctalia-shell"
          '';
      };
    };

}

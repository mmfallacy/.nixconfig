{
  flake.nixosModules.noctalia =
    { extras, ... }:
    {
      imports = [
        extras.noctalia.nixosModules.default
      ];

      services.noctalia-shell.enable = true;

      nix.settings = {
        substituters = [ "https://noctalia.cachix.org" ];
        trusted-public-keys = [
          "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4="
        ];
        fallback = false;
      };
    };

  flake.hjemModules.noctalia =
    { pkgs, ... }@inputs:
    let
      json = pkgs.formats.json { };
      toml = pkgs.formats.toml { };
    in
    {
      xdg.config.files = {
        "noctalia/settings.json" = {
          generator = json.generate "settings.json";
          value = import ./_settings.nix inputs;
        };

      };
    };
}

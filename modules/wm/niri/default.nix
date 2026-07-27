{
  flake.nixosModules.niri =
    {
      config,
      lib,
      extras,
      ...
    }:
    {
      options.custom.system.niri.enable = lib.mkEnableOption "system.niri";

      imports = [
        extras.niri.nixosModules.niri
      ];

      config = lib.mkIf config.custom.system.niri.enable {
        nixpkgs.overlays = [ extras.niri.overlays.niri ];
        programs.niri.enable = true;
        # Use sodiboo's binary cache for niri. This is by default
        niri-flake.cache.enable = true;
      };

      nix.settings = {
        substituters = [
          "https://niri-nix.cachix.org"
        ];

        trusted-public-keys = [
          "niri-nix.cachix.org-1:SvFtqpDcf7Sm1SMJdby1/+Y+6f3Yt3/3PMcSTKPJNJ0="
        ];
      };
    };

  flake.hjemModules.niri =
    {
      config,
      lib,
      ...
    }:
    {
      options.custom.home.niri.enable = lib.mkEnableOption "home.niri";

      config = lib.mkIf config.custom.home.niri.enable {
        xdg.config.files."niri/config.kdl".text = # kdl
          "";
      };
    };
}

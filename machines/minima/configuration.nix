{
  flake.nixosMachineModules.minima =
    { lib, extras, ... }:
    {

      custom.system =
        let
          enabled = [
            "core"
            "nix"
            "grub"
            "noctalia"
            "niri"
            "locale-en-PH"
            "weston"
            "nh"
            "ly"
          ];
          mapper = name: {
            inherit name;
            value.enable = true;
          };
        in
        lib.pipe enabled [
          (map mapper)
          builtins.listToAttrs
        ];

      environment.systemPackages = [
        extras.pkgs-last.cowsay
      ];

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      system.stateVersion = "25.05";

    };
}

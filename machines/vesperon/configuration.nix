top: {
  flake.nixosMachineModules.vesperon =
    {
      lib,
      extras,
      ...
    }:
    {
      custom.system =
        let
          enabled = [
            "core"
            "nix"
            "pipewire"
            "grub"
            "locale-en-PH"
            "weston"
            "ly"
            "niri"
            "nh"
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

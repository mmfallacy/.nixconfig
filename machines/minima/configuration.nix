top: {
  flake.nixosMachineModules.minima =
    {
      lib,
      pkgs,
      extras,
      ...
    }:
    {
      imports = with top.config.flake.nixosModules; [
        core
        nix
        grub
        noctalia
        niri
        locale_en_PH
        weston
        nh
        ly
      ];

      environment.systemPackages = [
        extras.pkgs-last.cowsay
      ];

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      system.stateVersion = "25.05";

    };
}

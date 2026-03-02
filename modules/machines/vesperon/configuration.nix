top: {
  flake.nixosModules.machine-vesperon =
    {
      lib,
      extras,
      ...
    }:
    {
      imports = with top.config.flake.nixosModules; [
        core
        nix
        pipewire
        grub
        locale_en_PH
        weston
        ly
        niri
        vmware-shared
        nh
      ];

      environment.systemPackages = [
        extras.pkgs-last.cowsay
      ];

      nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
      system.stateVersion = "25.05";
    };

}

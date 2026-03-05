top: {
  flake.nixosModules.machine-minima =
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
        locale_en_PH
        weston
        nh
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
        packages = with pkgs; [
          kitty
          extras.nixnvim.neovim
        ];
        useDefaultShell = true;
      };
    };

}

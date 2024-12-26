{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... } @ inputs:
  let
    system = "x86_64-linux";
    pkgs = import nixpkgs {
    	inherit system;
      config.allowUnfree = true;
    };
    lib = nixpkgs.lib;
    profiles = import ./profiles inputs;
  in {
    nixosConfigurations.vm = lib.nixosSystem rec {
      inherit system;
      modules = [
        home-manager.nixosModules.home-manager
        ./machines/vm/configuration.nix
      ];
    };

    homeConfigurations.mmfallacy = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [ profiles.mmfallacy.home ];
    };
  };
}

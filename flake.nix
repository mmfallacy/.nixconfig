{
  description = "mmfallacy's NixOS Configuration";
  outputs = { self, nixpkgs, home-manager, ... } @ inputs: let
    system = "x86_64-linux";
    # Setting up nixpkgs sources
    default = {
      inherit system;
      config.allowUnfree = true;
    };
    # Use stable nixpkgs as main pkgs.
    pkgs = import nixpkgs default;
    # Link input to extras to explicitly pass to modules.
    # This attribute set will contain extra package sources.
    extras.pkgs-unstable = import inputs.nixpkgs-unstable default;

    # Load profiles.
    profiles = import ./profiles;
  in {
    # Set up nixosConfigurations (machines)
    nixosConfigurations.vm = nixpkgs.lib.nixosSystem rec {
      inherit system;
      modules = [
        home-manager.nixosModules.home-manager
        ./machines/vm/configuration.nix
      ];
      specialArgs = { inherit extras; };
    };

    # Set up homeConfigurations (profiles)
    homeConfigurations.mmfallacy = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [ profiles.mmfallacy.homeConfig ];
      exraSpecialArgs = { inherit extras; };
    };
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs"; # Only used for package deduplication.
  };

}

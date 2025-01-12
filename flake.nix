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
    extras.pkgs-master = import inputs.nixpkgs-master default;

    # Load profiles.
    profiles = import ./profiles;
  in {
    # Set up nixosConfigurations (machines)
    nixosConfigurations.vm = nixpkgs.lib.nixosSystem rec {
      inherit system;
      modules = [
        inputs.stylix.nixosModules.stylix
        home-manager.nixosModules.home-manager
        ./machines/vm/configuration.nix
      ];
      # Do not forget to also pass this to home-manager!
      specialArgs = { inherit extras; };
    };

    # Set up homeConfigurations (profiles)
    homeConfigurations.mmfallacy = home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      modules = [
        inputs.stylix.homeManagerModules.stylix
        profiles.mmfallacy.homeConfig
      ];
      exraSpecialArgs = { inherit extras; };
    };
  };

  inputs = {
    # Used as main nixpkgs version
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";

    # Used as main home-manager version
    # This should match main nixpkgs version
    home-manager.url = "github:nix-community/home-manager/release-24.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs"; # Only used for package deduplication.

    # This should also match main nixpkgs home-manager version
    stylix.url = "github:danth/stylix/release-24.11";
  };

}

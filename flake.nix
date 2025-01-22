{
  description = "mmfallacy's NixOS Configuration";
  outputs =
    {
      self,
      nixpkgs,
      home-manager,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      # Setting up nixpkgs sources
      default = {
        inherit system;
        config.allowUnfree = true;
      };
      # Use stable nixpkgs as main pkgs.
      pkgs = import nixpkgs default;
      lib = nixpkgs.lib;

      # mylib contains my own helper functions!
      # Use autowire/autoimport.nix to autowire mylib
      mylib = (import ./lib/autowire/autoimport.nix) { inherit pkgs lib; } ./lib;
      # mypkgs contains my own package definitions
      # Map { name = path } to  { name = fn } where fn takes parameters:
      # follows := which nixpkgs version should we follow? (pass pkgs/ extra.pkgs-*)
      # ... = additional parameters to pass package
      mypkgs = mylib.autowire.withMap ./packages (
        k: v:
        { follows, ... }@params:
        let
          rest = builtins.removeAttrs params [ "follows" ];
        in
        follows.callPackage v rest
      );

      # Link input to extras to explicitly pass to modules.
      # This attribute set will contain extra package sources.
      extras = {
        pkgs-unstable = import inputs.nixpkgs-unstable default;
        pkgs-master = import inputs.nixpkgs-master default;
        nil = inputs.nil.packages.${system}.nil;

        inherit (inputs) niri;
        inherit mypkgs;
      };
    in
    # Load profiles. profiles = import ./profiles;
    rec {
      # Set up nixosConfigurations (machines)
      nixosConfigurations.vm = lib.nixosSystem {
        inherit system;
        modules = [
          inputs.stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager

          ./machines/vm/configuration.nix
        ];
        # Do not forget to also pass this to home-manager!
        specialArgs = { inherit extras mylib units; };
      };

      # Autowire units. Units := my very own nix modules.
      units = with mylib; {
        themes = autowire.base ./themes;
        user = autowire.base ./user;
        system = autowire.base ./system;
      };

      # Export mypkgs and mylib as flake outputs
      inherit mypkgs mylib;

      profiles = mylib.autowire.base ./profiles;
      # Set up homeConfigurations (profiles)
      homeConfigurations.mmfallacy = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          inputs.stylix.homeManagerModules.stylix
          profiles.mmfallacy.homeConfig
        ];
        extraSpecialArgs = { inherit extras; };
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

    niri.url = "github:sodiboo/niri-flake/main";

    # Add nil upstream as input. Some changes are still not part of a release, e.g. pipe-operator support
    nil.url = "github:oxalica/nil/main";
  };

}

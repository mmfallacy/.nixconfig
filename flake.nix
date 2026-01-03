{
  description = "mmfallacy's NixOS Configuration";
  outputs =
    {
      self,
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
      pkgs = import inputs.nixpkgs default;
      lib = inputs.nixpkgs.lib;

      # mylib contains my own helper functions!
      # Use autowire/autoimport.nix to autowire mylib
      mylib = (import ./lib/autowire/autoimport.nix) { inherit pkgs lib; } ./lib;
      # mypkgs contains my own package definitions
      # Map { name = path } to  { name = fn } where fn takes parameters:
      # follows := which nixpkgs version should we follow? (pass pkgs/ extra.pkgs-*)
      # ... = additional parameters to pass package
      # TODO: Reconsider follows argument. Do I really need it?
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
        pkgs-last = import inputs.nixpkgs-last default;
        hm = home-manager;

        nh = inputs.nh.packages.${system}.nh;
        flakeup = inputs.flakeup.packages.${system}.flakeup;
        nixnvim = inputs.nixnvim.packages.${system};

        inherit (inputs.secrets.outputs) secrets;
        inherit (inputs) niri;
        inherit mypkgs;

      };
    in
    # Load profiles. profiles = import ./profiles;
    rec {
      # Set up nixosConfigurations (machines)
      nixosConfigurations.vesperon = lib.nixosSystem {
        inherit system;
        modules = [
          inputs.stylix.nixosModules.stylix
          home-manager.nixosModules.home-manager
          {
            home-manager.sharedModules = builtins.attrValues homeModules;

          }
          # inputs.lix-module.nixosModules.default

          ./machines/vesperon/configuration.nix
        ];
        # Import all custom modules;

        # Do not forget to also pass this to home-manager!
        specialArgs = {
          inherit
            extras
            mylib
            units

            # This will be used by system/nix.nix to set NIXPATH
            inputs
            ;
        };
      };

      # Autowire units. Units := my very own nix modules.
      units = with mylib; {
        themes = autowire.base ./themes;
        profiles = autowire.withMap ./profiles (
          # Import and inherit const for all users.
          k: v: if mylib.last k == "const" then import v else v
        );
        system = autowire.base ./system;
      };

      # Export mypkgs and mylib as flake outputs
      inherit mypkgs mylib;
      inherit extras;

      profiles = mylib.autowire.base ./profiles;

      homeModules = mylib.autowire.base ./modules/home-manager;
      # Set up homeConfigurations (profiles)
      homeConfigurations.mmfallacy = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          inputs.stylix.homeManagerModules.stylix
          units.profiles.mmfallacy.profile
        ];
        extraSpecialArgs = { inherit extras units mylib; };
      };

      # Flake templates:
      flakeup = import ./templates { inherit pkgs lib; };
    };

  inputs = {
    # Used as main nixpkgs version
    nixpkgs.url = "github:nixos/nixpkgs/nixos-25.05";
    # Create an input pointing to last main nixpkgs version in case something breaks!
    nixpkgs-last.url = "github:nixos/nixpkgs/nixos-24.11";

    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";

    # Use lix instead of nix via lix-module
    # Refer to docs/lix-vs-nix.md for a list of known discrepancies when migrating from nix to lix
    lix-module = {
      url = "https://git.lix.systems/lix-project/nixos-module/archive/2.93.2-1.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Used as main home-manager version
    # This should match main nixpkgs version
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs"; # Only used for package deduplication.

    # This should also match main nixpkgs home-manager version
    stylix = {
      url = "github:danth/stylix/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    niri = {
      url = "github:sodiboo/niri-flake/main";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
      inputs.nixpkgs-stable.follows = "nixpkgs";
    };

    nh = {
      url = "github:nix-community/nh?ref=v4.2.0-beta2";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # flakeup
    # A supercharged nix flake init -t
    flakeup.url = "github:mmfallacy/flakeup/main";

    # My .nixnvim
    # This has its own nixpkgs input so behavior is consistent with .nixnvim dev environment
    nixnvim.url = "github:mmfallacy/.nixnvim/main";

    # Local secret git submodule flake.
    # See NixOS/nix/issues/12281 for more information
    # self.submodules = true;
    # secrets.url = "./secrets";

    secrets = {
      url = "git+file:./secrets";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

}

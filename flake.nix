{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, ... } @ inputs:
  let
    # Inject user library code:
    args = inputs // {
      # Root path resolver
      R = import ./lib/relpath.nix self;
    };
  in {
    nixosConfigurations.vm = import ./hosts/vm {inherit args;};
  };
}

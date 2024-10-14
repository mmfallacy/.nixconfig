{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs, ... } @ inp:
  let
    # Inject user library code:
    inputs = inp // {
      # Root path resolver
      R = import ./lib/relpath.nix self;
    };
  in
  {
    nixosConfigurations.vm = import ./hosts/vm/configuration.nix {inherit inputs;};
  };
}

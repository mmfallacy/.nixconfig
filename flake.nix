{
  description = "NixOS Configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs, ... } @ inputs:{
    nixosConfigurations.vm = import ./hosts/vm/configuration.nix {inherit inputs;};
  };
}

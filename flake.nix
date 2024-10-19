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
    mylib = import ./mylib inputs;
    mkHost = mylib.mkHost {inherit inputs; inherit mylib;};
  in {
    nixosConfigurations.vm = mkHost "vm" "x86_64-linux";
  };
}

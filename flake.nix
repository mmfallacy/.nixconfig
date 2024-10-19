{
  description = "NixOS Configuration";

  # Flake dependencies.
  # `nixpkgs` is locked to NixOS Release 24.05.
  # `nixpkgs-unstable` is locked to NixOS unstable.
  # `home-manager` is locked to Release 24.05, with its nixpkgs following `nixpkgs`.
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs?ref=nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  # Flake outputs.
  # nixosConfigurations.{host} are valid targets for `nixos-rebuild`
  outputs = { self, ... } @ inputs:
  let
    # This set contains utility functions defined in ./mylib.
    mylib = import ./mylib inputs;

    # Function used to create hosts. mkHost also passes mylib to the host's configuration.nix.
    mkHost = mylib.mkHost {inherit inputs; inherit mylib;};
  in {

    # To create a new host, insert a new line containing nixosConfigurations.{hostname} = mkHost "${hostname}" {system};
    # e.g. nixosConfigurations.host = mkHost "host" "x86_64-linux";
    nixosConfigurations.vm = mkHost "vm" "x86_64-linux";
  };
}

{args}:
let
  system = "x86_64-linux";
  pkgs = import args.nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };
  lib = args.nixpkgs.lib;
in lib.nixosSystem {
  inherit system;
  modules = [
    ./hardware-configuration.nix
    ./configuration.nix
  ];

  specialArgs = args // {inherit pkgs;};
}

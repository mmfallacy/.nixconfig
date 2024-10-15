{...} @ args:
let
  inherit (args.inputs) nixpkgs home-manager;

  system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
    config.allowUnfree = true;
  };

in nixpkgs.lib.nixosSystem {
  inherit system;
  modules = [
    home-manager.nixosModules.home-manager
    ./hardware-configuration.nix
    ./configuration.nix
  ];

  specialArgs = args // {inherit pkgs;};
}

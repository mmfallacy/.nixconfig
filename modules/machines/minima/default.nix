{
  config,
  inputs,
  mkExtras,
  ...
}:
let
  machine = "minima";
  system = "x86_64-linux";
in
{
  flake.nixosConfigurations.${machine} = inputs.nixpkgs.lib.nixosSystem {
    specialArgs.extras = mkExtras system;
    specialArgs.inputs = inputs;
    modules = [
      config.flake.nixosModules."machine-${machine}"
      inputs.home-manager.nixosModules.home-manager
      { networking.hostName = machine; }
    ];
  };
}

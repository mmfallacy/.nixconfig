{
  config,
  inputs,
  ...
}:
let
  machine = "vesperon";
in
{
  flake.nixosConfigurations.${machine} = inputs.nixpkgs.lib.nixosSystem {
    modules = [
      config.flake.nixosModules."machine-${machine}"
      inputs.home-manager.nixosModules.home-manager
    ];
  };
}

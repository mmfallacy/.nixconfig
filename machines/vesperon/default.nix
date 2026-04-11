{
  config,
  inputs,
  mkExtras,
  ...
}:
let
  machine = "vesperon";
  system = "x86_64-linux";
in
{
  flake.nixosConfigurations.${machine} = inputs.nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs.extras = mkExtras system;
    specialArgs.inputs = inputs;
    modules = [
      {
        imports = [
          config.flake.nixosModules.all
        ];
        hjem.extraModules = [
          config.flake.hjemModules.all
        ];
      }
      config.flake.nixosMachineModules.${machine}
      { networking.hostName = machine; }
      inputs.hjem.nixosModules.default
    ];
  };
}

{
  config,
  inputs,
  mkExtras,
  ...
}:
let
  machine = "mnemon";
  system = "x86_64-linux";
in
{
  flake.nixosConfigurations.${machine} = inputs.nixpkgs.lib.nixosSystem {
    inherit system;
    specialArgs.extras = mkExtras system;
    specialArgs.inputs = inputs;
    specialArgs.mylib = config.flake.lib;
    modules = [
      {
        imports = [
          config.flake.nixosModules.all
        ];
        hjem.extraModules = [
          config.flake.hjemModules.all
        ];
        hjem.specialArgs.mylib = config.flake.lib;
      }
      config.flake.nixosMachineModules.mnemon-base
      { networking.hostName = machine; }
      inputs.hjem.nixosModules.default
    ];
  };
}

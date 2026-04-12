{
  config,
  inputs,
  mkExtras,
  ...
}:
let
  machine = "aetheron";
  system = "aarch64-darwin";
in
{
  flake.darwinConfigurations.${machine} = inputs.nix-darwin.lib.darwinSystem {
    inherit system;
    specialArgs.extras = mkExtras system;
    specialArgs.inputs = inputs;
    modules = [
      {
        imports = [
          config.flake.darwinModules.all
        ];
        hjem.extraModules = [
          config.flake.hjemModules.all
        ];
      }
      config.flake.nixosMachineModules.${machine}
      {
        networking.hostName = machine;
        networking.computerName = machine;
      }
      inputs.hjem.darwinModules.default
    ];
  };
}

{ config, ... }:
{
  flake.darwinConfigurations.aetheron = config.flake.lib.mkSystem {
    machine = "aetheron";
    system = "aarch64-darwin";
    platform = "darwin";
    modules = [
      config.flake.nixosMachineModules.aetheron
    ];
  };
}

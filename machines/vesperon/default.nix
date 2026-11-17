{ config, ... }:
{
  flake.nixosConfigurations.vesperon = config.flake.lib.mkSystem {
    machine = "vesperon";
    system = "x86_64-linux";
    platform = "nixos";
    modules = [
      config.flake.nixosMachineModules.vesperon
    ];
  };
}

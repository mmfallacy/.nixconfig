{ config, ... }:
{
  flake.nixosConfigurations.mnemon = config.flake.lib.mkSystem {
    machine = "mnemon";
    system = "x86_64-linux";
    platform = "nixos";
    modules = [
      config.flake.nixosMachineModules.mnemon-base
      config.flake.nixosMachineModules.mnemon-hypervisor
    ];
  };
}

{ config, ... }:
{
  flake.nixosConfigurations.minima-nixos-qemu-wsl = config.flake.lib.mkSystem {
    machine = "minima-nixos-qemu-wsl";
    system = "x86_64-linux";
    platform = "nixos";
    modules = [
      config.flake.nixosMachineModules.minima-base
      config.flake.nixosMachineModules.minima-nixos-qemu-wsl
    ];
  };
}

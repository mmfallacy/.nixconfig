{
  flake.nixosMachineModules.minima =
    { ... }:
    {
      specialisation."VMWare Guest".configuration = {
        virtualisation.vmware.guest.enable = true;
        custom.system.vmware-shared.enable = true;

	custom.system.grub.enable = true;

      };
    };
}

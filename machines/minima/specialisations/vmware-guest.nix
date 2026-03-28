top: {
  flake.nixosMachineModules.minima =
    {
      ...
    }:
    {
      specialisation."VMWare Guest".configuration = {
        virtualisation.vmware.guest.enable = true;
        custom.system.vmware-shared.enable = true;
      };
    };
}

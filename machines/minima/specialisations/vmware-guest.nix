top: {
  flake.nixosModules.machine-minima =
    {
      lib,
      pkgs,
      extras,
      ...
    }:
    {
      specialisation."VMWare Guest".configuration = {
        virtualisation.vmware.guest.enable = true;
        imports = with top.config.flake.nixosModules; [
          vmware-shared
        ];
      };
    };
}

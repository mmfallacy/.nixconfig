top: {
  flake.nixosMachineModules.minima-nixos-qemu-wsl =
    { ... }:
    {

      custom.system.grub.enable = true;

      networking.firewall.allowedTCPPorts = [ 7420 ];

      system.stateVersion = "25.05";
    };
}

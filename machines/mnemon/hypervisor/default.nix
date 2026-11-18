{
  flake.nixosMachineModules.mnemon-hypervisor = {
    imports = [
      ./_networking.nix
      ./_guests/haos
    ];

    # TODO: Add the microvm.nix input and import its NixOS host module here.
    # Register NixOS guests with microvm.vms.<name>.config, importing their
    # local guest modules (e.g. ./_guests/services), not mnemon-base hardware.
    # Choose autostart explicitly once the guests are ready.

    # TODO: Add libvirt and nixvirt for HAOS. Keep the host's admin account
    # separate from VM service accounts and guest accounts.
  };
}

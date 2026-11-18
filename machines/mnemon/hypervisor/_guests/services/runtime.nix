{
  # TODO: Select the QEMU backend and explicit microvm.nix vCPU/RAM limits.
  # Define virtual NICs with unique MACs and attach them to host-owned bridges.
  # Allocate persistent guest volumes and decide whether to share a read-only
  # host Nix store. Do not share writable host directories by default.
}

{
  # This is a host-side module, not a NixOS guest configuration.
  imports = [
    ./domain.nix
    ./image.nix
  ];

  # TODO: Register the HAOS libvirt domain and choose its autostart policy.
  # HAOS manages its own OS, Supervisor, applications, and guest users.
}

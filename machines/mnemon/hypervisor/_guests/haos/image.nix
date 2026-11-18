{
  # TODO: Pin the official HAOS QCOW2 bootstrap image and its hash.
  # Provision a writable copy once, only if the destination does not exist
  # (for example /var/lib/libvirt/images/haos.qcow2).
  # Never replace the running disk on rebuild: HAOS updates it in place.
  # Plan off-host Home Assistant backups separately from bootstrap provisioning.
}

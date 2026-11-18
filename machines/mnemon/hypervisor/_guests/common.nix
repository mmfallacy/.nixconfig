{
  # NixOS guests only; HAOS does not import this module.
  # TODO: Set shared SSH, locale, and Nix policy when the first guest is defined.
  # Do not import mnemon-base: physical disks, boot, desktop, and host users
  # belong to the host, not to guests.
}

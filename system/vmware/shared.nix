{ ... }:
let
  mountPoint = "/mnt/hgfs";
in
{
  # Based on wmertens' proposed solution
  # https://github.com/NixOS/nixpkgs/issues/46529#issuecomment-876324542
  systemd.tmpfiles.rules = [
    "d '${mountPoint}' 0755 root root - -"
  ];

  fileSystems."${mountPoint}" = {
    device = ".host:/";
    fsType = "fuse./run/current-system/sw/bin/vmhgfs-fuse";
    options = [
      "umask=22"
      "uid=1000"
      "gid=1000"
      "allow_other"
      "defaults"
      "auto_unmount"
    ];
  };
}

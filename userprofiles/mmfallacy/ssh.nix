{ units, ... }:
{
  imports = [
    units.userprofiles.common.ssh
  ];

  # Set up keys to use per host
  # Ideally keys should be generated per system.
  # TODO: Decide if this matter should be part of per-machine home config or per-user home config!!
  programs.ssh.matchBlocks = {
    "mmfallacy-extra.github.com" = {
      hostname = "github.com";
      identityFile = "~/.ssh/mmfallacy-extra_ed25519";
    };
    "github.com" = {
      hostname = "github.com";
      identityFile = "~/.ssh/id_ed25519";
    };
  };
}

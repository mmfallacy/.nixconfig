{ units, ... }:
{
  imports = [
    units.profiles.common.security.keychain
  ];

  programs.keychain.keys = [
    "mmfallacy-extra_ed25519"
    "ryuuudev_ed25519"
  ];
}

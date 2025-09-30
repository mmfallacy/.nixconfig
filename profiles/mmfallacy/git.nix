{
  units,
  pkgs,
  const,
  ...
}:
{
  # Import base git config
  imports = [
    units.profiles.common.git
  ];

  custom.multi-user-git = {
    enable = true;
    users = [
      {
        username = const.username;
        email = const.email;
        signingKey = "~/.ssh/id_ed25519";
        authKey = "~/.ssh/id_ed25519";
      }
      {
        username = "mmfallacy-extra";
        email = "205347616+mmfallacy-extra@users.noreply.github.com";
        signingKey = "~/.ssh/mmfallacy-extra_ed25519";
        authKey = "~/.ssh/mmfallacy-extra_ed25519";
      }
      {
        username = "ryuuudev";
        email = "211357809+ryuuudev@users.noreply.github.com";
        signingKey = "~/.ssh/ryuuudev_ed25519";
        authKey = "~/.ssh/ryuuudev_ed25519";
      }
      {
        username = "harmoniq-solutions";
        email = "235274822+harmoniq-solutions@users.noreply.github.com";
        signingKey = "~/.ssh/harmoniq_ed25519";
        authKey = "~/.ssh/harmoniq_ed25519";
      }
    ];
  };

}

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

  # Set url aliases for mmfallacy-extra account.
  # This GitHub account hosts all non-code repositories.
  programs.git.extraConfig.url = {
    # This sets up automatic hostname-based multi-user SSH signing keys.
    # Refer to ssh config on how to make this work!
    "ssh://git@mmfallacy-extra.github.com/".InsteadOf = "gh-extra:";
    "ssh://git@ryuuudev.github.com/".InsteadOf = "gh-ryu:";
  };

  # Create quick script to make local git config use mmfallacy-extra credentials
  home.packages = [
    (pkgs.writeShellScriptBin "git-mmfallacy-extra" ''
      git config --local user.name "mmfallacy-extra"
      git config --local user.email "205347616+mmfallacy-extra@users.noreply.github.com"
      git config --local user.signingKey "~/.ssh/mmfallacy-extra_ed25519"
    '')

    (pkgs.writeShellScriptBin "git-ryuuudev" ''
      git config --local user.name "ryuuudev"
      git config --local user.email "211357809+ryuuudev@users.noreply.github.com"
      git config --local user.signingKey "~/.ssh/ryuuudev_ed25519"
    '')
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
    ];
  };

}

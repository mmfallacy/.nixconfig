{ units, ... }:
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
  };
}

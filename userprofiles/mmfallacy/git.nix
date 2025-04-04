{ units, ... }:
{
  # Import base git config
  imports = [
    units.userprofiles.common.git
  ];

  # Set url aliases for mmfallacy-extra account.
  # This GitHub account hosts all non-code repositories.
  programs.git.extraConfig.url = {
    # This sets up automatic hostname-based multi-user SSH signing keys.
    # Refer to ssh config on how to make this work!
    "https://mmfallacy-extra.github.com/".insteadOf = "gh-extra:";
    "ssh://git@mmfallacy-extra.github.com/".pushInsteadOf = "gh-extra:";
  };
}

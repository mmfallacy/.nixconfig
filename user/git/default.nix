{
  const,
  pkgs,
  lib,
  ...
}:
{
  home.packages = with pkgs; [ git ];
  programs.git = {
    enable = true;

    userName = const.username;
    userEmail = const.email;

    signing.key = "~/.ssh/id_ed25519";
    signing.signByDefault = true;
    extraConfig.gpg.format = "ssh";

    extraConfig = {
      init.defaultBranch = "main";

      # Currently, I primarily use nvim hence I'm setting nvim as the default diff and merge tool
      diff.tool = lib.mkDefault "nvimdiff";
      merge.tool = lib.mkDefault "nvim";
    };

    # TODO: Think of a way to make this not user-specific.
    extraConfig.url = {
      "https://github.com/".insteadOf = "github:";
      "ssh://git@github.com/".insteadOf = "github:";

      # This sets up automatic hostname-based multi-user SSH signing keys.
      # Refer to ssh config on how to make this work!
      "https://mmfallacy-extra.github.com/".insteadOf = "gh-extra:";
      "ssh://git@mmfallacy-extra.github.com/".pushInsteadOf = "gh-extra:";
    };

    aliases = import ./aliases.nix;

  };
}

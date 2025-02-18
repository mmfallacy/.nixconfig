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

    aliases = import ./aliases.nix;

  };
}

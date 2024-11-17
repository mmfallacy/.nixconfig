{config, lib, ...}:

# Git User Module.
# This module enables and configure git.
# Associated name and email is linked to my primary github account.
# DO NOT FORGET TO SET SIGNING KEY
# Signing key is not included as it may vary depending on host.

let
  PROGRAM = "git";
  selfopts = config.usermodules.${PROGRAM};
  cfg = {
    assertions = [
      {
        assertion = selfopts.signingkey == null;
        message = "This module requires a signing key to be set per host usage.";
      }
    ];
    programs.git = {
      enable = true;
      userName = "mmfallacy";
      userEmail = "31348500+mmfallacy@users.noreply.github.com";
      aliases = import ./aliases.nix;
      signing.signByDefault = true;
      signing.key = selfopts.signingkey;
      extraConfig.init.defaultBranch = "main";
    };
  };

in {
  # Declare Options
  options.usermodules.${PROGRAM} = {
    enable = lib.mkEnableOption PROGRAM;
    signingkey = lib.mkOption {
      type = lib.types.string;
      description = "Pass to git nix module which signing key to use";
      # Get GPG key ID through `gpg --list-secret-keys --keyid-format=long`
    };
  };
  # Create config
  config = lib.mkIf selfopts.enable cfg;
}

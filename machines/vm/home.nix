inputs @ { lib , ... }: let
  profiles = import ../../profiles inputs;
  inherit (profiles.mmfallacy.const) username name;
  inherit (profiles.mmfallacy) homeConfig;
in lib.recursiveUpdate (homeConfig inputs) {
  programs.git.extraConfig.gpg.format = "ssh";
  programs.git.signing.key = "~/.ssh/id_ed25519";
}

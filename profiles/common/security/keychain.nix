{ pkgs, ... }:
{
  programs.keychain = {
    enable = true;
    keys = pkgs.lib.mkBefore [
      "id_ed25519"
      "id_rsa"
    ];
    agents = pkgs.lib.mkBefore [
      "ssh"
    ];
  };
}

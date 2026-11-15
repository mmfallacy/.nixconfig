{
  flake.nuciConfigs.heimdall = {
    uci.rawUci = [
      "uci set dropbear.@dropbear[0].enable='1'"
      "uci set dropbear.@dropbear[0].Port='22'"
      "uci set dropbear.@dropbear[0].PasswordAuth='1'"
      "uci set dropbear.@dropbear[0].RootPasswordAuth='1'"
      "uci set dropbear.@dropbear[0].RootLogin='1'"
      "uci commit dropbear"
    ];

    uci.sshKeys = [
      "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIPUXKxoErHfK/z5UDw/rOwadz0DAgQzqVnsmSc3rARkd 31348500+mmfallacy@users.noreply.github.com"
    ];
  };
}

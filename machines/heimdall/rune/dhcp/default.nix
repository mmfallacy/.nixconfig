{
  flake.nuciConfigs.heimdall = { lib, ... }: {
    uci.rawUci =
      let
        entries = import ./_entries.nix;
        reservations = lib.concatMap (
          { name, mac, ip }:
          [
            "uci set dhcp.${name}=host"
            "uci set dhcp.${name}.name='${name}'"
            "uci set dhcp.${name}.mac='${mac}'"
            "uci set dhcp.${name}.ip='${ip}'"
            "uci set dhcp.${name}.dns='1'"
          ]
        ) entries;
      in
      lib.flatten [
        "uci set dhcp.rune=dhcp"
        "uci set dhcp.rune.interface='rune'"
        "uci set dhcp.rune.start='100'"
        "uci set dhcp.rune.limit='150'"
        "uci set dhcp.rune.leasetime='12h'"

        reservations

        "uci commit dhcp"
      ];
  };
}

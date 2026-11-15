{
  flake.nuciConfigs.heimdall = {
    uci.rawUci = [
      "uci set dhcp.rune=dhcp"
      "uci set dhcp.rune.interface='rune'"
      "uci set dhcp.rune.start='100'"
      "uci set dhcp.rune.limit='150'"
      "uci set dhcp.rune.leasetime='12h'"
      "uci commit dhcp"
    ];
  };
}

{
  flake.nuciConfigs.heimdall = {
    uci.rawUci = [
      "uci set dhcp.veil=dhcp"
      "uci set dhcp.veil.interface='veil'"
      "uci set dhcp.veil.start='100'"
      "uci set dhcp.veil.limit='150'"
      "uci set dhcp.veil.leasetime='12h'"
      "uci commit dhcp"
    ];
  };
}

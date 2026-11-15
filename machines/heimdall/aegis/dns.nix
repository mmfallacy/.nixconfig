{
  flake.nuciConfigs.heimdall = {
    # Keep the existing DHCP and dnsmasq sections intact.
    uci.rawUci = [
      "uci set dhcp.heimdall_internal=domain"
      "uci set dhcp.heimdall_internal.name='heimdall.internal'"
      "uci set dhcp.heimdall_internal.ip='192.168.1.1'"
      "uci commit dhcp"
    ];
  };
}

{
  flake.nuciConfigs.heimdall = { lib, ... }: {
    uci.rawUci =
      let
        forwarding = [
          "uci set firewall.rune_wan=forwarding"
          "uci set firewall.rune_wan.src='rune'"
          "uci set firewall.rune_wan.dest='wan'"
        ];

        allowDNS = [
          "uci set firewall.rune_dns=rule"
          "uci set firewall.rune_dns.name='Allow-DNS-Rune'"
          "uci set firewall.rune_dns.src='rune'"
          "uci set firewall.rune_dns.dest_port='53'"
          "uci set firewall.rune_dns.proto='tcp udp'"
          "uci set firewall.rune_dns.target='ACCEPT'"
        ];

        allowDHCP = [
          "uci set firewall.rune_dhcp=rule"
          "uci set firewall.rune_dhcp.name='Allow-DHCP-Rune'"
          "uci set firewall.rune_dhcp.src='rune'"
          "uci set firewall.rune_dhcp.dest_port='67'"
          "uci set firewall.rune_dhcp.proto='udp'"
          "uci set firewall.rune_dhcp.family='ipv4'"
          "uci set firewall.rune_dhcp.target='ACCEPT'"
        ];
      in
      lib.flatten [
        "uci set firewall.rune=zone"
        "uci set firewall.rune.name='rune'"
        "uci set firewall.rune.network='rune'"
        "uci set firewall.rune.input='REJECT'"
        "uci set firewall.rune.output='ACCEPT'"
        "uci set firewall.rune.forward='REJECT'"

        forwarding
        allowDNS
        allowDHCP

        "uci commit firewall"
      ];
  };
}

{
  flake.nuciConfigs.heimdall = { lib, ... }: {
    uci.rawUci =
      let
        forwarding = [
          "uci set firewall.veil_wan=forwarding"
          "uci set firewall.veil_wan.src='veil'"
          "uci set firewall.veil_wan.dest='wan'"
        ];

        allowDNS = [
          "uci set firewall.veil_dns=rule"
          "uci set firewall.veil_dns.name='Allow-DNS-Veil'"
          "uci set firewall.veil_dns.src='veil'"
          "uci set firewall.veil_dns.dest_port='53'"
          "uci set firewall.veil_dns.proto='tcp udp'"
          "uci set firewall.veil_dns.target='ACCEPT'"
        ];

        allowDHCP = [
          "uci set firewall.veil_dhcp=rule"
          "uci set firewall.veil_dhcp.name='Allow-DHCP-Veil'"
          "uci set firewall.veil_dhcp.src='veil'"
          "uci set firewall.veil_dhcp.dest_port='67'"
          "uci set firewall.veil_dhcp.proto='udp'"
          "uci set firewall.veil_dhcp.family='ipv4'"
          "uci set firewall.veil_dhcp.target='ACCEPT'"
        ];
      in
      lib.flatten [
        "uci set firewall.veil=zone"
        "uci set firewall.veil.name='veil'"
        "uci set firewall.veil.network='veil'"
        "uci set firewall.veil.input='REJECT'"
        "uci set firewall.veil.output='ACCEPT'"
        "uci set firewall.veil.forward='REJECT'"

        forwarding
        allowDNS
        allowDHCP

        "uci commit firewall"
      ];
  };
}

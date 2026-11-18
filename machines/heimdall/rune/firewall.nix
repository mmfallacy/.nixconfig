{
  flake.nuciConfigs.heimdall = { lib, ... }: {
    uci.rawUci =
      let
        dhcpEntries = import ./dhcp/_entries.nix;

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

        # No destination zone: this grants access to the router, not forwarding.
        allowMnemonManagement =
          let
            mnemon = lib.findFirst (entry: entry.name == "mnemon") null dhcpEntries;
          in
          if mnemon == null then
            lib.warn "Rune: mnemon is missing from dhcpEntries; skipping router management access" [ ]
          else
            [
              "uci set firewall.rune_mnemon_management=rule"
              "uci set firewall.rune_mnemon_management.name='Allow-Mnemon-Management-Rune'"
              "uci set firewall.rune_mnemon_management.src='rune'"
              "uci set firewall.rune_mnemon_management.src_ip='${mnemon.ip}'"
              "uci set firewall.rune_mnemon_management.src_mac='${mnemon.mac}'"
              "uci set firewall.rune_mnemon_management.dest_ip='192.168.20.1'"
              "uci set firewall.rune_mnemon_management.dest_port='22 80 443'"
              "uci set firewall.rune_mnemon_management.proto='tcp'"
              "uci set firewall.rune_mnemon_management.family='ipv4'"
              "uci set firewall.rune_mnemon_management.target='ACCEPT'"
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
        allowMnemonManagement

        "uci commit firewall"
      ];
  };
}

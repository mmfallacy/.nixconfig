{
  flake.nuciConfigs.heimdall = {
    # Wi-Fi-only guest network: no tagged wired ports or changes to br-lan.
    uci.rawUci = [
      "uci set network.veil_dev=device"
      "uci set network.veil_dev.name='br-veil'"
      "uci set network.veil_dev.type='bridge'"
      "uci set network.veil=interface"
      "uci set network.veil.device='br-veil'"
      "uci set network.veil.proto='static'"
      "uci set network.veil.ipaddr='192.168.100.1'"
      "uci set network.veil.netmask='255.255.255.0'"
      "uci commit network"

      "uci set wireless.veil=wifi-iface"
      "uci set wireless.veil.device='radio0'"
      "uci set wireless.veil.disabled='0'"
      "uci set wireless.veil.network='veil'"
      "uci set wireless.veil.mode='ap'"
      "uci set wireless.veil.ssid='Heimdall-Veil'"
      "uci set wireless.veil.encryption='sae-mixed'"
      "uci set wireless.veil.key='Patronage6-Uncrushed1'"
      "uci commit wireless"
    ];
  };
}

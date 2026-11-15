{
  flake.nuciConfigs.heimdall = {
    # Wi-Fi-only IoT network: no tagged wired ports or changes to br-lan.
    uci.rawUci = [
      "uci set network.rune_dev=device"
      "uci set network.rune_dev.name='br-rune'"
      "uci set network.rune_dev.type='bridge'"
      "uci set network.rune=interface"
      "uci set network.rune.device='br-rune'"
      "uci set network.rune.proto='static'"
      "uci set network.rune.ipaddr='192.168.20.1'"
      "uci set network.rune.netmask='255.255.255.0'"
      "uci commit network"

      "uci set wireless.rune=wifi-iface"
      "uci set wireless.rune.device='radio0'"
      "uci set wireless.rune.disabled='0'"
      "uci set wireless.rune.network='rune'"
      "uci set wireless.rune.mode='ap'"
      "uci set wireless.rune.ssid='Heimdall-Rune'"
      "uci set wireless.rune.encryption='psk2'"
      "uci set wireless.rune.key='Tried4-Unnamed3-Armless2-Wrath4'"
      "uci set wireless.rune.isolate='1'"
      "uci commit wireless"
    ];
  };
}

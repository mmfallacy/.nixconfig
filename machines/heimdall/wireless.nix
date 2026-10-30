{ lib, ... }:
let
  ssid = "Heimdall";
  wifiPassword = "Tucking6-Onscreen7";
in
{
  flake.nuciConfigs.heimdall = {
    uci.packages = [
      "-wpad-basic-mbedtls"
      "wpad-mbedtls"
      "usteer"
    ];

    uci.settings.usteer.usteer = [
      {
        _type = "usteer";
        network = "lan";
        roam_scan_snr = -65;
        signal_diff_threshold = 8;
        band_steering_interval = 120000;
        ssid_list = [ ssid ];
      }
    ];

    # Preserve the board-specific wifi-device definitions while configuring both APs.
    uci.rawUci =
      lib.concatMap
        (
          radio:
          let
            iface = "default_${radio}";
          in
          [
            "uci set wireless.${radio}.disabled='0'"
            "uci set wireless.${iface}=wifi-iface"
            "uci set wireless.${iface}.device='${radio}'"
            "uci set wireless.${iface}.network='lan'"
            "uci set wireless.${iface}.mode='ap'"
            "uci set wireless.${iface}.ssid='${ssid}'"
            "uci set wireless.${iface}.encryption='sae-mixed'"
            "uci set wireless.${iface}.key='${wifiPassword}'"
            "uci set wireless.${iface}.bss_transition='1'"
            "uci set wireless.${iface}.ieee80211k='1'"
          ]
        )
        [
          "radio0"
          "radio1"
        ]
      ++ [ "uci commit wireless" ];
  };
}

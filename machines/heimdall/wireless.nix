{ lib, ... }:
{
  flake.nuciConfigs.heimdall = {
    uci.packages = [
      "-wpad-basic-mbedtls"
      "wpad-mbedtls"
    ];

    # Keep the device-specific radio paths, channels, and widths from OpenWrt.
    uci.rawUci = lib.concatMap (radio: [
      "uci set wireless.${radio}.disabled='0'"
      "uci set wireless.${radio}.country='PH'"
    ]) [
      "radio0"
      "radio1"
    ] ++ [ "uci commit wireless" ];
  };
}

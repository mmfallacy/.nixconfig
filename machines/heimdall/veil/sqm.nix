{
  flake.nuciConfigs.heimdall = {
    uci.packages = [ "sqm-scripts" ];

    # SQM rates are kbit/s; this is one shared 100 Mbps limit per direction.
    uci.rawUci = [
      "uci set sqm.veil=queue"
      "uci set sqm.veil.enabled='1'"
      "uci set sqm.veil.interface='br-veil'"
      "uci set sqm.veil.download='100000'"
      "uci set sqm.veil.upload='100000'"
      "uci set sqm.veil.qdisc='cake'"
      "uci set sqm.veil.script='piece_of_cake.qos'"
      "uci commit sqm"
    ];
  };
}

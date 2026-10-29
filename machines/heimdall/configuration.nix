{
  flake.nuciConfigs.heimdall = {
    uci.packageManager = "apk";
    uci.settings.system.system = [
      {
        _type = "system";
        hostname = "heimdall";
      }
    ];
  };
}

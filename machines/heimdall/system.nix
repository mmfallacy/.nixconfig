{
  flake.nuciConfigs.heimdall = {
    uci.settings.system.system = [
      {
        _type = "system";
        hostname = "heimdall";
      }
    ];
  };
}

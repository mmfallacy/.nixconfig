{
  flake.nixosModules.clipsync =
    {
      config,
      lib,
      extras,
      ...
    }:
    {
      options.custom.system.clipsync.enable = lib.mkEnableOption "system.clipsync";
      options.custom.system.clipsync.tcpPort = lib.mkOption {
        type = lib.types.port;
        default = 15353;
        description = "TCP Port used by Clipp";
      };

      config =
        let
          cfg = config.custom.system.clipsync;
        in
        lib.mkIf cfg.enable {
          networking.firewall.allowedTCPPorts = [ cfg.tcpPort ];

          environment.systemPackages = [
            extras.mypkgs.martona-clipp
          ];
          services.avahi.enable = true;

        };
    };
}

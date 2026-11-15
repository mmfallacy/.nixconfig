{
  flake.hjemModules.unfocus =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    let
      cfg = config.custom.home.unfocus;
    in
    {
      options.custom.home.unfocus = {
        enable = lib.mkEnableOption "home.unfocus";
        username = lib.mkOption {
          type = lib.types.str;
          description = "SSH username for the Windows host machine we want to uncapture and minimize VNC";
        };
        ip = lib.mkOption {
          type = lib.types.str;
          description = "IP address for the Windows host machine we want to uncapture and minimize VNC";
        };
      };

      config = lib.mkIf cfg.enable {
        packages = [
          (pkgs.writeShellApplication {
            name = "unfocus";
            runtimeInputs = [ pkgs.openssh ];
            text = ''
              exec ssh ${lib.escapeShellArg "${cfg.username}@${cfg.ip}"} ./unfocus.exe
            '';
          })
        ];
      };
    };
}

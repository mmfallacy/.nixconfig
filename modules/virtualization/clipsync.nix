{
  flake.nixosModules.clipsync =
    {
      config,
      lib,
      pkgs,
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
          clipp = extras.mypkgs.martona-clipp;

          sync = pkgs.writeShellApplication {
            name = "clipp-sync";
            runtimeInputs = with pkgs; [
              bash
              wl-clipboard
              coreutils
              xxhash
              clipp
            ];

            text = # bash
              ''
                set -euo pipefail

                state_dir="''${XDG_RUNTIME_DIR:-/tmp}/clipsync"
                mkdir -p "$state_dir"

                sent_hash_file="$state_dir/sent"
                received_hash_file="$state_dir/received"

                # wl-clipboard -> Clipp
                # shellcheck disable=SC2016
                wl-paste --watch bash -c '
                  data=$(cat)
                  hash=$(printf "%s" "$data" | sha256sum | cut -d" " -f1)
                  printf "Sending:\n %s\n Hash: %s" "$data" "$hash"
                  old=$(cat "'"$sent_hash_file"'" 2>/dev/null || true)

                  if [ "$hash" != "$old" ]; then
                    echo "$hash" > "'"$sent_hash_file"'"
                    printf "%s" "$data" | clipp copy
                  fi
                ' 2>&1 &

                # Clipp -> wl-clipboard
                while true; do
                  sleep 1
                  data=$(clipp paste 2>/dev/null || true)

                  if [ -z "$data" ]; then
                    continue
                  fi

                  hash=$(printf "%s" "$data" | sha256sum | cut -d" " -f1)
                  old=$(cat "$received_hash_file" 2>/dev/null || true)
                  if [ "$hash" != "$old" ]; then
                    echo "$hash" > "$received_hash_file"
                    printf "Received:\n %s\n Hash: %s" "$data" "$hash"
                    printf "%s" "$data" | wl-copy
                  fi

                done
              '';
          };
        in
        lib.mkIf cfg.enable {
          networking.firewall.allowedTCPPorts = [ cfg.tcpPort ];

          environment.systemPackages = [
            pkgs.wl-clipboard
            clipp
          ];
          services.avahi.enable = true;

          systemd.user.services.clipsync = {
            enable = true;
            description = "Sync Clipp and wl-clipboard";
            after = [ "graphical-session.target" ];
            partOf = [ "graphical-session.target" ];

            serviceConfig = {
              ExecStart = "${sync}/bin/clipp-sync";
              Restart = "on-failure";
              RestartSec = 2;
            };

            wantedBy = [ "graphical-session.target" ];
          };
        };
    };
}

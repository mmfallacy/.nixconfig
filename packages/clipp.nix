{
  perSystem =
    {
      system,
      pkgs,
      lib,
      ...
    }:
    {
      packages.martona-clipp =
        if system != "x86_64-linux" then
          throw "this flake only uses martona/clipp for x86_64-linux"
        else
          pkgs.stdenv.mkDerivation rec {
            pname = "Clipp";
            version = "1.4.1.153";

            src = pkgs.fetchurl {
              # clipp-linux-amd64 handles x86_64 also
              url = "https://github.com/martona/clipp/releases/download/v${version}/clipp-linux-amd64";
              hash = "sha256-G3vvs70qDo9tyUb7B65D4DCFC4hDfHHM7mx4OSOwR/8=";
            };

            dontUnpack = true;

            nativeBuildInputs = [
              pkgs.autoPatchelfHook
            ];

            buildInputs = with pkgs; [
              stdenv.cc.cc.lib
              libsodium
              zstd
              xxhash
              avahi
            ];

            installPhase = ''
              install -Dm755 $src $out/bin/clipp
            '';

            meta = {
              description = "Free, open-source, peer-to-peer, clipboard sync for Windows, macOS, and iOS, with a terminal-only client for Linux";
              homepage = "https://github.com/martona/clipp";
              license = lib.licenses.mit;
              mainProgram = "clipp";
              platforms = [ "x86_64-linux" ];
            };
          };
    };
}

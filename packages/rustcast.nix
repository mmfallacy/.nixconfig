{
  perSystem =
    {
      system,
      pkgs,
      lib,
      ...
    }:
    {
      packages.rustcast =
        if system != "aarch64-darwin" then
          throw "this flake only uses RustCastLabs/rustcast for aarch64-darwin"
        else
          pkgs.stdenvNoCC.mkDerivation rec {
            pname = "rustcast";
            version = "0.7.3";

            src = pkgs.fetchurl {
              url = "https://github.com/RustCastLabs/rustcast/releases/download/v${version}/Rustcast-universal-macos.app.zip";
              sha256 = "sha256-xTl4J6btUHo9nCdPKRFoEGkeo1y3tz+fKLpkbOCQVfE=";
            };

            dontUnpack = true;
            nativeBuildInputs = [ pkgs.libarchive ];

            installPhase = ''
              mkdir -p $out/Applications/
              mkdir -p unzipped
              # Using bsdtar instead of unzip as unzip breaks .app codesigning.
              bsdtar -xf $src -C unzipped
              cp -R unzipped/target/release/macos/Rustcast.app $out/Applications/Rustcast.app

              # Symlink executables to bin
              mkdir -p $out/bin
              ln -s $out/Applications/Rustcast.app/Contents/MacOS/rustcast $out/bin/rustcast
            '';

            meta = {
              description = "An open source alternative to raycast, in rust!!";
              homepage = "https://github.com/RustCastLabs/rustcast";
              license = lib.licenses.mit;
              mainProgram = "rustcast";
              platforms = [ "aarch64-darwin" ];
            };
          };
    };
}

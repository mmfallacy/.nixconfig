{
  perSystem =
    { system, pkgs, ... }:
    {
      packages.omniwm =
        if system != "aarch64-darwin" then
          throw "this flake only uses BarutSRB/OmniWM for aarch64-darwin"
        else
          pkgs.stdenvNoCC.mkDerivation rec {
            pname = "OmniWM";
            version = "0.4.7.4";

            src = pkgs.fetchurl {
              url = "https://github.com/BarutSRB/OmniWM/releases/download/v${version}/OmniWM-v${version}.zip";
              sha256 = "sha256-6POMtHn5R1CQcz29QORrJaEuBxMPe7aYTtn0VWpQXIo=";
            };

            dontUnpack = true;
            nativeBuildInputs = [ pkgs.libarchive ];

            installPhase = ''
              mkdir -p $out/Applications/
              # Using bsdtar instead of unzip as unzip breaks .app codesigning.
              bsdtar -xf $src -C $out/Applications/
            '';
          };
    };
}

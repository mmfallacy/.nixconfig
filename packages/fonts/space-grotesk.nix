{
  stdenvNoCC,
  fetchzip,
  lib,
}:

stdenvNoCC.mkDerivation rec {
  pname = "space-grotesk";
  version = "2.0.0";
  src = fetchzip {
    url = "https://github.com/floriankarsten/space-grotesk/releases/download/${version}/SpaceGrotesk-${version}.zip";
    stripRoot = false;
    hash = "sha256-niwd5E3rJdGmoyIFdNcK5M9A9P2rCbpsyZCl7CDv7I8=";
  };

  installPhase = ''
    runHook preInstall

    pushd SpaceGrotesk-${version}/ttf/static

    mkdir -p $out/share/fonts/truetype

    mv *.ttf $out/share/fonts/truetype

    popd

    runHook postInstall
  '';

  meta = {
    description = "";
    homepage = "";
    license = lib.licenses.ofl;
  };

}

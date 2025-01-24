{
  vimUtils,
  fetchFromGitHub,
  lib,
}:

vimUtils.buildVimPlugin {
  pname = "live-preview.nvim";
  version = "2025-01-24";
  src = fetchFromGitHub {
    owner = "brianhuster";
    repo = "live-preview.nvim";
    rev = "330a6ac95a4eece731117ca5956250821bae8010";
    sha256 = "sha256-4RxXh3Qx03pW63SpDwhA0ALVkCWCRiR6OnAzurpp88o=";
  };
  meta.homepage = "https://github.com/brianhuster/live-preview.nvim/";
  meta.license = lib.licenses.gpl3Only;

}

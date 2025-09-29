{
  pkgs,
  extras,
}:
with pkgs;
mkShell {
  name = ".nixconfig js-bun template";

  nativeBuildInputs = [
    extras.pkgs-unstable.bun
    vtsls
  ];

}

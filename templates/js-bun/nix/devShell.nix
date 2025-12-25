{
  pkgs,
  extras,
}:
with pkgs;
mkShell {
  name = "@@PROJNAME@@ development shell";

  nativeBuildInputs = [
    extras.pkgs-unstable.bun
    vtsls
  ];

}

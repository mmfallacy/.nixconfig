{
  pkgs,
}:
with pkgs;
mkShell {
  name = "@@PROJNAME@@ development shell";

  nativeBuildInputs = [
    go
    gopls
  ];

}

{
  perSystem =
    { pkgs, ... }:
    {
      devShells.default = pkgs.mkShell {
        name = "@@PROJNAME@@ development shell";

        nativeBuildInputs = [
        ];

      };
    };
}

{
  perSystem =
    { pkgs, extras, ... }:
    {
      devShells.default = pkgs.mkShell {
        name = "testshell";
        nativeBuildInputs = [
          extras.pkgs-last.cowsay
        ];
      };
    };
}

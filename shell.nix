{
  pkgs ? import <nixpkgs> { },
  extraPkgs ? [ ],
}:
pkgs.mkShellNoCC {
  name = "default";
  buildInputs =
    with pkgs;
    [
      nh
    ]
    ++ extraPkgs;
}

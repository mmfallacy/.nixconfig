{
  pkgs ? import <nixpkgs> { },
  extraPkgs ? [ ],
}:
pkgs.mkShellNoCC {
  name = "default";
  buildInputs =
    with pkgs;
    [
      nvfetcher
      nh
    ]
    ++ extraPkgs;
}

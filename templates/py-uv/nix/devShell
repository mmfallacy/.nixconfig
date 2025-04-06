{ pkgs, ... }:
let
  python = pkgs.python310Full;
in
pkgs.mkShell {
  packages = [
    python
    pkgs.uv
  ];

  env =
    {
      UV_PYTHON_DOWNLOADS = "never";
      UV_PYTHON = python.interpreter;
    }
    // pkgs.lib.optionalAttrs pkgs.stdenv.isLinux {
      LD_LIBRARY_PATH = pkgs.lib.makeLibraryPath pkgs.pythonManylinuxPackages.manylinux1;
      # Use Tkinter backend for linux
      MPLBACKEND = "TkAgg";
    };

  shellHook = ''
    unset PYTHONPATH
  '';
}

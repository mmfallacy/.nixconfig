{
  inputs = {
    # Channel urls are faster and more reliable than github
    nixpkgs.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz";
    nixpkgs-stable.url = "https://channels.nixos.org/nixos-25.11/nixexprs.tar.xz";

    flake-parts.url = "github:hercules-ci/flake-parts";
  };
  outputs =
    inputs@{ flake-parts, ... }:
    let
      inherit (inputs.nixpkgs) lib;
      shouldImport = file: file.hasExt "nix" && !(lib.hasPrefix "_" file.name);
      import-tree =
        path:
        lib.pipe path [
          (lib.fileset.fileFilter shouldImport)
          (lib.fileset.toList)
        ];
    in
    flake-parts.lib.mkFlake { inherit inputs; } {
      imports = import-tree ./modules;
    };
}

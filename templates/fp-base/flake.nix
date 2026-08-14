{
  description = "@@PROJNAME@@";
  outputs =
    inputs@{ self, flake-parts, ... }:
    let
      inherit (inputs.nixpkgs-stable) lib;
      shouldImport = file: file.hasExt "nix" && !(lib.hasPrefix "_" file.name);
      import-tree =
        path:
        lib.pipe path [
          (lib.fileset.fileFilter shouldImport)
          (lib.fileset.toList)
        ];
    in
    flake-parts.lib.mkFlake { inherit inputs; } {
      debug = true;
      systems = [
        "x86_64-linux"
        "aarch64-darwin"
      ];

      imports = lib.flatten [
        (import-tree ./nix)
      ];

      perSystem =
        { system, ... }:
        let
          default = {
            inherit system;
            config.allowUnfree = true;
          };
        in
        {
          _module.args.pkgs = import inputs.nixpkgs-stable default;
          _module.args.extras = {
            # pkgs-unstable = import inputs.nixpkgs-unstable default;
          };
        };
    };

  inputs = {
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs-stable";
    };
    nixpkgs-stable.url = "https://channels.nixos.org/nixos-26.05/nixexprs.tar.xz";
    # nixpkgs-unstable.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz";
  };
}

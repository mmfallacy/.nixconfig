{
  inputs = {
    # Channel urls are faster and more reliable than github
    nixpkgs.url = "https://channels.nixos.org/nixos-25.11/nixexprs.tar.xz";
    nixpkgs-unstable.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz";
    nixpkgs-last.url = "https://channels.nixos.org/nixos-24.11/nixexprs.tar.xz";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";

    # Used as main home-manager version
    # This should match main nixpkgs version
    home-manager.url = "github:nix-community/home-manager/release-25.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs"; # Only used for package deduplication.

    flake-parts.url = "github:hercules-ci/flake-parts";

    nh = {
      url = "github:nix-community/nh?ref=v4.2.0-beta2";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flakeup.url = "github:mmfallacy/flakeup/main";
    nixnvim.url = "github:mmfallacy/.nixnvim/main";

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
      debug = true;
      systems = [
        "x86_64-linux"
        "aarch64-darwin"
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
          _module.args.pkgs = import inputs.nixpkgs default;
          _module.args.extras = {
            pkgs-unstable = import inputs.nixpkgs-unstable default;
            pkgs-master = import inputs.nixpkgs-master default;
            pkgs-last = import inputs.nixpkgs-last default;

            nh = inputs.nh.packages.${system}.nh;
            flakeup = inputs.flakeup.packages.${system}.flakeup;
            nixnvim = inputs.nixnvim.packages.${system};

            # inherit (inputs.secrets.outputs) secrets;
            # inherit (inputs) niri;
            # inherit mypkgs;
          };
        };

      imports = import-tree ./modules;
    };
}

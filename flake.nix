{
  inputs = {
    # Channel urls are faster and more reliable than github
    nixpkgs.url = "https://channels.nixos.org/nixos-25.11/nixexprs.tar.xz";
    nixpkgs-unstable.url = "https://channels.nixos.org/nixos-unstable/nixexprs.tar.xz";
    nixpkgs-last.url = "https://channels.nixos.org/nixos-24.11/nixexprs.tar.xz";
    nixpkgs-master.url = "github:nixos/nixpkgs/master";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs";
    };

    hjem = {
      url = "github:feel-co/hjem";
      inputs.nixpkgs.follows = "nixpkgs";
      inputs.nix-darwin.follows = "nix-darwin";
    };

    niri = {
      url = "github:sodiboo/niri-flake/main";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
      inputs.nixpkgs-stable.follows = "nixpkgs";
    };

    noctalia = {
      url = "github:noctalia-dev/noctalia-shell/main";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };

    nh = {
      url = "github:nix-community/nh?ref=v4.3.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    flakeup.url = "github:mmfallacy/flakeup/main";
    nixnvim.url = "github:mmfallacy/.nixnvim/main";

  };
  outputs =
    inputs@{ self, flake-parts, ... }:
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

      _module.args.mkExtras =
        system:
        let
          default = {
            inherit system;
            config.allowUnfree = true;
          };
        in
        {
          pkgs-unstable = import inputs.nixpkgs-unstable default;
          pkgs-master = import inputs.nixpkgs-master default;
          pkgs-last = import inputs.nixpkgs-last default;

          nh = inputs.nh.packages.${system}.nh;
          flakeup = inputs.flakeup.packages.${system}.flakeup;
          nixnvim = inputs.nixnvim.packages.${system};

          # inherit (inputs.secrets.outputs) secrets;
          inherit (inputs) niri noctalia;
          mypkgs = self.packages.${system};
        };

      perSystem =
        { system, pkgs, ... }:
        {
          _module.args.pkgs = import inputs.nixpkgs {
            inherit system;
            config.allowUnfree = true;
          };

          devShells.default = import ./shell.nix { inherit pkgs; };
        };

      imports = lib.flatten [
        (import-tree ./modules)
        (import-tree ./machines)
        (import-tree ./packages)
      ];
    };
}

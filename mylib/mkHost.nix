{...} @ args:
name: system:
  let
    inherit (args.inputs) nixpkgs home-manager;
    inherit (args.mylib) R;
    inherit system;

    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };

  in nixpkgs.lib.nixosSystem {
    inherit system;
    modules = [
      home-manager.nixosModules.home-manager
      (R "./hosts/${name}/hardware-configuration.nix")
      (R "./hosts/${name}/configuration.nix")
    ];

    specialArgs = args // {inherit pkgs;};
  }

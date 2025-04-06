{
  description = "rust-template";
  inputs = {
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
  };

  outputs =
    { nixpkgs-stable, ... }:
    let
      supportedSystems = [ "x86_64-linux" ];
    in
    builtins.foldl' (a: b: a // b) { } (
      builtins.map (
        system:
        let
          pkgs-stable = nixpkgs-stable.legacyPackages.${system};
        in
        {
          devShells.${system}.default = import ./nix/devShell.nix { pkgs = pkgs-stable; };
        }
      ) supportedSystems
    );
}

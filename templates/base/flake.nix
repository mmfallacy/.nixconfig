{
  inputs = {
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-25.05";
    systems.url = "github:nix-systems/default";
  };

  outputs =
    { nixpkgs-stable, systems, ... }:
    builtins.foldl' (a: b: a // b) { } (
      builtins.map (
        system:
        let
          pkgs-stable = nixpkgs-stable.legacyPackages.${system};
        in
        {
          devShells.${system}.default = import ./nix/devShell.nix { pkgs = pkgs-stable; };
        }
      ) (import systems)
    );
}

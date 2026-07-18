{
  description = "python-uv-template";
  inputs = {
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.11";
    systems.url = "github:nix-systems/default";
  };

  outputs =
    { nixpkgs-stable, systems, ... }:
    builtins.foldl' (nixpkgs-stable.lib.recursiveUpdate) { } (
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

{
  config,
  inputs,
  mkExtras,
  ...
}:
{
  flake.lib.mkSystem =
    {
      machine,
      system,
      platform,
      modules,
    }:
    let
      platforms = {
        nixos = {
          build = inputs.nixpkgs.lib.nixosSystem;
          systemModule = config.flake.nixosModules.all;
          hjemModule = inputs.hjem.nixosModules.default;
          networking.hostName = machine;
        };
        darwin = {
          build = inputs.nix-darwin.lib.darwinSystem;
          systemModule = config.flake.darwinModules.all;
          hjemModule = inputs.hjem.darwinModules.default;
          networking = {
            hostName = machine;
            computerName = machine;
          };
        };
      };
      selected = platforms.${platform};
    in
    selected.build {
      inherit system;
      specialArgs = {
        inherit inputs;
        extras = mkExtras system;
        mylib = config.flake.lib;
      };
      modules = [
        {
          imports = [ selected.systemModule ];
          hjem.extraModules = [ config.flake.hjemModules.all ];
          hjem.specialArgs.mylib = config.flake.lib;
        }
      ]
      ++ modules
      ++ [
        { inherit (selected) networking; }
        selected.hjemModule
      ];
    };
}

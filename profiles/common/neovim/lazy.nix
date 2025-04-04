{
  lib,
  pkgs,
  extras,
}: let
  # Load plugin list
  plugins = import ./plugins.nix { inherit pkgs extras; };

  # pkgs.linkfarm requires a list of entries of the shape { name: string; path = path_to_derivation; }
  mkEntryFromDrv = drv:
    if lib.isDerivation drv then { name = "${lib.getName drv}"; path = drv; }
    else drv;

  # This path serves as the location where we install all neovim plugins for lazy to handle.
  lazypath = pkgs.linkFarm "lazy-plugins" (builtins.map mkEntryFromDrv plugins);

in lazypath

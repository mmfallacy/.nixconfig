# Require pkgs and lib (so lib/default.nix can wire it first)
{ pkgs, lib }:
let
  autowire = import ./base.nix { inherit pkgs lib; };
in

# Function ( name -> oldValue -> newValue )
directory: map: lib.mapAttrsRecursive (map) (autowire directory)

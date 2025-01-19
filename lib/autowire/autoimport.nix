# Require pkgs and lib (so lib/default.nix can wire it first)
{ pkgs, lib }:
let
  autowire = import ./withMap.nix { inherit pkgs lib; };
  map = k: v: import v { inherit pkgs lib; };
in

directory: autowire directory map

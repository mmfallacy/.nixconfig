{ pkgs, extras, ... }: let
  master = extras.pkgs-master;
  unstable = extras.pkgs-unstable;
in with pkgs; [

  # Lua
  lua-language-server
  stylua

  # Nix
  nil
  alejandra
  unstable.nixfmt-rfc-style
]

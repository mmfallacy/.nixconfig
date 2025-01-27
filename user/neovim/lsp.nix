{ pkgs, extras, ... }:
let
  master = extras.pkgs-master;
  unstable = extras.pkgs-unstable;
in
with pkgs;
[

  # Lua
  lua-language-server
  stylua

  # Nix
  extras.nil
  alejandra
  unstable.nixfmt-rfc-style

  # Zig
  zls
  # zig has its own fmt command

  # Markdown
  # stable has version 2024-10-07 which is 3 releases behind latest (2024-12-18) at the time of writing.
  unstable.marksman

  # Prettier
  nodePackages.prettier
]

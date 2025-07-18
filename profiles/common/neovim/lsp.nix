{ pkgs, extras, ... }:
# NOTE: If possible, please include only global LSPs here. Per-project language servers and formatters should reside in each project's respective devShell!
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
  nixd
  alejandra
  unstable.nixfmt-rfc-style

  # Zig
  zls
  # zig has its own fmt command

  # Markdown
  # stable has version 2024-10-07 which is 3 releases behind latest (2024-12-18) at the time of writing.
  unstable.marksman

  # Typescript
  nodePackages.prettier

  # Bash
  shfmt
  shellcheck
  bash-language-server
]

This repository also holds project starter templates per language. The templates are loosely based on [Mitchel H.'s ghostty](https://github.com/ghostty-org/ghostty) nix shell configuration.

## Supported Languages

### 1. Rust

This template includes Rust cli tools (`cargo`, `rustc`) and other development tooling (LSP:`rust-analyzer`, Formatter: `rustfmt`, Linter: `clippy`) as native build inputs. Other project dependencies are handled through Cargo. Also, `RUST_SRC_PATH` is set as it is required by `rust-analyzer`.

### 2. JavaScript `pnpm`

This template includes NodeJS (v23 of `nixpkgs-stable`). Also, it creates script aliases for `corepack pnpm/pnpx`.

NOTE: Should I use corepack pnpm or stick to the nixpkgs `pnpm`? Currently, I think it's better to

Also, direnv [#73](https://github.com/direnv/direnv/issues/73) does not currently support functions and aliases as .envrc is loaded in a separate bash process. Consequently, since the flake and its aliases are loaded via direnv, we lose much of the `shellAliases` functionality. To work around this we create a new script and add it in path in place of the aliases.

TODO^: Investigate this further!

## References

- [github:iynaix/dotfiles](https://github.com/iynaix/dotfiles/tree/main/templates)

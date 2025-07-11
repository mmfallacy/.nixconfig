# `.nixconfig` Rust template.

This template bootstraps a Rust project with an existing devShell. The devShell initially ships with the following packages:

- `cargo` and `rustc` for Rust compilation.
- `rust-analyzer` for language server features.
- `clippy` and `rustfmt` for linting and formatting.

Also, the `RUST_SRC_PATH` environment variable is set up using `pkgs.rustPlatform`.

---

### To Do

- [ ] Consider rewriting the template using [`github:nix-community/fenix`](https://github.com/nix-community/fenix)
- [ ] Explore necessity of `RUST_SRC_PATH` being set to `pkgs.rustPlatform.rustLibSrc`

{
  pkgs,
}:
with pkgs;
mkShell {
  name = "clink";

  nativeBuildInputs = [
    # Rust
    cargo
    rustc

    # Rust tooling: linter, fmt
    rust-analyzer
    clippy
    rustfmt
  ];

  env.RUST_SRC_PATH = "${pkgs.rustPlatform.rustLibSrc}";
}

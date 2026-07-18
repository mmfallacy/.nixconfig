{
  pkgs,
}:
with pkgs;
mkShell {
  name = ".nixconfig rust template";

  nativeBuildInputs = [
    # Rust
    cargo
    rustc

    # Rust tooling: linter, fmt
    rust-analyzer
    clippy
    rustfmt
  ];

  RUST_SRC_PATH = "${pkgs.rustPlatform.rustLibSrc}";
  RUST_BACKTRACE = 1;
}

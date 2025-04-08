This repository also holds project starter templates per language. The templates are loosely based on [Mitchel H.'s ghostty](https://github.com/ghostty-org/ghostty) nix shell configuration.

## Supported Languages

### 1. Rust

This template includes Rust cli tools (`cargo`, `rustc`) and other development tooling (LSP:`rust-analyzer`, Formatter: `rustfmt`, Linter: `clippy`) as native build inputs. Other project dependencies are handled through Cargo. Also, `RUST_SRC_PATH` is set as it is required by `rust-analyzer`.

### 2. JavaScript `pnpm`

This template includes NodeJS (v23 of `nixpkgs-stable`). Also, it creates script aliases for `corepack pnpm/pnpx`.

> NOTE: Should I use corepack pnpm or stick to the nixpkgs `pnpm`? Currently, I think it's better to

Also, direnv [#73](https://github.com/direnv/direnv/issues/73) does not currently support functions and aliases as .envrc is loaded in a separate bash process. Consequently, since the flake and its aliases are loaded via direnv, we lose much of the `shellAliases` functionality. To work around this we create a new script and add it in path in place of the aliases.

> TODO^: Investigate this further!

For `create-*` apps bootstrapped through `pnpm create`, clone the template first then run the command. Ensure that the command bootstraps the project into a temporary folder in the case where it refuses to run on a non-empty directory.

> An alternative method for this is to start a shell first via `nix-shell` with packages `nodePackages.pnpm` and `nodejs_xx`. This lets the user use both NodeJS and PNPM temporarily to bootstrap the project before setting the devShell up. Do note that `pnpm` is installed here explicitly rather than using `corepack` as some `create-*` apps require `pnpm` to be available in the path. The flake template works around this by adding aliases via scripts in PATH.

### 3. Python `uv`

This template includes Python 3.10 (`python310Full`, which packages TKinter) and [`github:astral-sh/uv`](https://github.com/astral-sh/uv). Environment variables are also set to tweak `uv`'s behavior to adhere to a nix system's constraints. That is, `uv` must not handle Python binary downloads and `uv` should use the nix-installed python binary as its interpreter.

> TODO^: Investigate discrepancy of python3xFull and python3x. Also, explore options where I can explicitly include only modules I need.

Also, we create a mock dynamic library path using `manylinux1` as some dependencies rely on these. These libraries do not normally exist in an isolated nix-devShell context and hence prompts for explicit workarounds. `manylinux1` is a standard which packages dynamic libraries present in a CentOS5 system. Thus, it might fall short for newer python dependencies that might require other dynamic libraries. In this case, reconsider using a different manylinux standard.

Lastly, we also unset `PYTHONPATH` pertains to the path where Python looks for modules and packages. `uv run` already constructs a ready-to-use Python environment complete with the necessary dependencies. This makes the dependency propagation by Python from `nixpkgs` unnecessary.

> TODO^: Investigate further. This portion is only lifted from `uv2nix`'s base usage. I still do not fully understand its significance and consequences. However, I have successfully used this template for a python project of mine which uses `tkinter` as a `matplotlib` backend.

References:

- [discourse.nixos.org:Python3x vs Python3xFull](https://discourse.nixos.org/t/python3x-vs-python3xfull-package-name-change-in-2016-vs-standardized-semantic-adopt-to-standard-python-semantic/10896)
- [github:pyproject-nix/uv2nix](https://github.com/pyproject-nix/uv2nix)
- [nixos.org:Nixpkgs Manual #setup-hook-python](https://nixos.org/manual/nixpkgs/stable/#setup-hook-python)
- [github:nixpkgs/b841c6.../pkg*/dev*/int\*/python/setup-hook.sh](https://github.com/NixOS/nixpkgs/blob/b841c624fda46a8e28a007684eb56d407fb246b8/pkgs/development/interpreters/python/setup-hook.sh)

## Other References

- [github:iynaix/dotfiles](https://github.com/iynaix/dotfiles/tree/main/templates)

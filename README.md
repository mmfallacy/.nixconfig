# mmfallacy's `.nixconfig`

This repository is my attempt at creating my first very own Nix configuration. Currently, this repository is not used as
my daily development driver as I have deployed it in a virtual machine with the intention of further incorporating my
[Arch dotfiles](https://github.com/mmfallacy/.dotfiles). This is not intended to be a Nix configuration template but
feel free to fork and reuse my configuration structure! 🌟

## Structure:

### `./machines`

This folder holds the nixosConfigurations (i.e. configuration for my hosts/machines) that I import in flake.nix Current
machines defined:

- `vm`: My NixOS VM in VMWare Workstation. I am currently developing this `.nixconfig` here.

### `./system`

This folder holds the system modules (i.e. modules imported and installed system-level) that I use to define my
machines.

### `./user`

This folder holds the user modules (i.e. modules imported and installed user-level via `home-manager`) that I use to
define my machines.

## References:

- [github:notusknot/dotfiles-nix](https://github.com/notusknot/dotfiles-nix)
- [github:ryan4yin/nixos-and-flakes-book](https://github.com/ryan4yin/nixos-and-flakes-book)
- [youtube:Vimjoyer/Nix tutorials](https://www.youtube.com/playlist?list=PLko9chwSoP-15ZtZxu64k_CuTzXrFpxPE)
- [youtube:LibrePhoneix/NixOS Config Guides for NHerds and Other Cool People](https://www.youtube.com/playlist?list=PL_WcXIXdDWWpuypAEKzZF2b5PijTluxRG)
- [github:librephoenix/nixos-config](https://github.com/librephoenix/nixos-config)

# mmfallacy's `.nixconfig`

This repository now hosts my attempt at creating a maintainable (subjective, maintainable in my sense) Nix configuration using [`flake-parts`](https://github.com/hercules-ci/flake-parts). After daily driving Nix for development purposes for the past year, I've come to manage a few (3 lol) machines with this configuration.

The configuration still loosely incorporates [my setup during my Arch days](https://github.com/mmfallacy/.dotfiles).

This is still not intended to be a Nix configuration template, but feel free to fork and use my configuration structure! 🌟

> Do note that I am still running `vesperon`, my main development machine in a virtual machine. VMs give me the ability to suspend and resume development whenever I need to context switch (gaming). `aetheron` on the other hand is running `nixos-darwin` on my work macbook.

## Structure:

### `./machines`

This folder holds the `nixosConfigurations` (configuration for my hosts/machines) that I import in `flake.nix`. Current machines defined:

- `vesperon`: My NixOS VM in VMWare Workstation.
- `minima`: Another NixOS VM with VMware guest specialisation.

Each machine directory contains:

- `configuration.nix` - system-level configuration
- `hardware.nix` - hardware configuration
- `home/` - home-manager user configuration
- `specialisations/` - machine-specific specializations

### `./modules`

This directory contains all Nix modules ala flake-parts organized by category:

- `audio/` - PipeWire audio configuration
- `boot/` - Boot loader modules (GRUB, systemd-boot)
- `locales/` - Locale settings (en_PH)
- `login/` - Login manager configuration (ly)
- `nix/` - Nix and nh (Nix helper) configuration
- `options/` - Custom flake options
- `shell/` - Shell utilities: zsh, git, starship, direnv, fastfetch, eza, hstr, fzf, any-nix-shell
- `vmware/` - VMware guest shared configuration
- `wm/` - Window manager modules: niri, noctalia, weston, gnome

### Root files

- `flake.nix` - Main flake entry point
- `flake.lock` - Locked dependencies
- `shell.nix` - Development shell

## References:

- [youtube:Vimjoyer/Nix tutorials](https://www.youtube.com/playlist?list=PLko9chwSoP-15ZtZxu64k_CuTzXrFpxPE)
- [github:iynaix/dotfiles](https://github.com/iynaix/dotfiles)
- [github:Michael-C-Buckley/nixos](https://github.com/Michael-C-Buckley/nixos)
- [docs:flake.parts](https://flake.parts/)

<details>
    <summary>Pre-dendritic references</summary>

- [github:notusknot/dotfiles-nix](https://github.com/notusknot/dotfiles-nix)
- [github:ryan4yin/nixos-and-flakes-book](https://github.com/ryan4yin/nixos-and-flakes-book)
- [youtube:LibrePhoneix/NixOS Config Guides for NHerds and Other Cool People](https://www.youtube.com/playlist?list=PL_WcXIXdDWWpuypAEKzZF2b5PijTluxRG)
- [github:librephoenix/nixos-config](https://github.com/librephoenix/nixos-config)
- [github:NotAShelf/nyx](https://github.com/notashelf/nyx)
</details>

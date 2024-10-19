# mmfallacy's .nixconfig
*This repository holds my personal nix configuration setup.*
## Resources:
- [github:notusknot/dotfiles-nix](https://github.com/notusknot/dotfiles-nix)
- [github:ryan4yin/nixos-and-flakes-book](https://github.com/ryan4yin/nixos-and-flakes-book)
- [youtube:Vimjoyer/Nix tutorials](https://www.youtube.com/playlist?list=PLko9chwSoP-15ZtZxu64k_CuTzXrFpxPE)
- [youtube:LibrePhoneix/ NixOS Config Guides for NHerds and Other Cool People](https://www.youtube.com/playlist?list=PL_WcXIXdDWWpuypAEKzZF2b5PijTluxRG)

## Structure:
- `R "/hosts"`: This directory contains host configurations that declaratively composes sysmodules to bootstrap a system.
- `R "/hosts/${HOSTNAME}/users"`: For a specific `HOSTNAME`, this contain user configurations. Multiple users can exist for a single hostname.
- `R "/mylib"`: This directory contains nix functions used as utility functions in this configuration.
- `R "/system"`: This directory contains system modules (sysmodules). These modules are intended to be used to configure a host.
- `R /flake.nix`: This is the main entry point of this configuration. It contains information on the configuration's dependencies and contains information on registeredhosts.

## Current Hosts:
- `vm`: Configuration for my VMWare NixOS Guest (2024).


> This repository is not meant to be used by others. I am sharing this only as a reference to help you build your own configuration. Feel free to submit an [issue](https://github.com/mmfallacy/.nixconfig/issues) or [pull request](https://github.com/mmfallacy/.nixconfig/pulls).


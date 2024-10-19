# `system`
This directory contains the system modules (sysmodules) used in a host's `configuration.nix`.

## List of sysmodules:
| Module name | How to Enable | Description |
| ----------- | ------------- | ----------- |
| `audio/pipewire.nix` | `config.sysmodules.pipewire.enable = true;` | Enables pipewire (\*) |
| `boot/grub.nix` | `config.sysmodules.grub.enable = true;` | Enables grub (\*) |
| `de/gnome.nix` | `config.sysmodules.gnome.enable = true;` | Enables X Server, Gnome, Sets X Keyboard Extension to US (\*) |
| `login/gdm.nix` | `config.sysmodules.gdm.enable = true;` | Enables GDM (\*) |
| `misc/gnupg.nix` | `config.sysmodules.gnupg.enable = true;` | Enables GnuPG and its agent |

> *(\*) pertains to modules defined in accordance to the default configuration of NixOS' Graphical ISO installer (installed with GNOME)*

`base.nix` is also located in this directory. This serves as the base configuration based on NixOS' Graphical ISO installer. The configuration includes:
- Resetting `environment.defaultPackages` to none from including `perl`, `rsync`,  `strace` by default
- Enabling experimental features: `nix-command`, `flakes`
- Enabling networkmanager and setting network host name to `nixos` (overridable)
- Sets timezone and locale to Philippines.
- Includes `neovim`, `git`, `just` as its initial packages.
- Sets system state version.




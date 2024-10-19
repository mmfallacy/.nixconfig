# `mylib`
This directory contains the declatation of utility functions used in this repository. `default.nix` exports all utility functions as an attribute set called `mylib`. This attribute set is then passed to all hosts' `configuration.nix` created by `mkHost`.
> Note that `mkHost` is a utility function that is defined in this directory.

## Current List of Utility functions:
- `pinPath`: When passed one argument `pinned`, it creates a function that returns a string path relative to `pinned`.
- `R`: Uses `pinPath` to create a function that returns a string path relative to the root directory (directory where `flake.nix` is in).
- `userFactory`: When passed a `usersFolder` directory path argument, it returns a function (typically called `mkUser` in a host's `configuration.nix`) that creates an attribute set containing:
  - `users.users.${username}` which sets up a normal user given some `description`. The user is also added to the `networkmanager` and `wheel` groups as per the default Nix configuration.
  - `networking.hostname` that's set to `username`
  - `home-manager.users.${username}` which imports the home-manager configuration for `username` contained in `"${userFolder}/${username}.nix"`
- `mkHost`: This returns a function that takes in `args` (refer to `flake.nix` usage), `name` which pertains to the host's name, and `system`. It uses `nixpkgs.lib.nixosSystem` to create a system that imports `home-manager`, and the host's `configuration.nix` and `hardware-configuration.nix`. It then forwards `args` to these modules, alongside `pkgs`.

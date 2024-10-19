# `hosts`
This directory holds the declarations of host and their corresponding configurations.

## Steps in creating a new host:
1. Create your host's directory `R "/hosts/${hostname}"`. Your `hostname` should correspond to what you'll pass to `mkHost`.
2. Generate your `hardware-configuration.nix` inside your host directory through running `nixos-generate-config`. You can use the `--dir` flag to specify where to place the generated files.
3. Replace the `configuration.nix` file with the version from `R "/hosts/template/configuration.nix"`.
4. In the copied `configuration.nix` from Step 4, replace the arguments of `mkUser` to your liking.
5. Next, create a user configuration file (`R "/hosts/${hostname}/users/${username}.nix` according to the provided template.
> Optionally, mix and match existing sysmodules to create your ideal system.
6. Register your new host in the root `flake.nix` by writing `nixosConfigurations.${hostname} = mkHost "${hostname}" "${system}"`.
7. Rebuild your system through `nixos-rebuild`. Don't forget to elevate permissions by using `sudo` or `doas`.
> `nixos-rebuild` looks for existing hosts through the flake's `outputs.nixosConfigurations`. Hence, running `nixos-rebuild switch --flake <path/to/flake>#<host>` looks for `outputs.nixosConfiguration.${host}`.


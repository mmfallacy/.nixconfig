# Generate your `hardware-configuration.nix` file via `nixos-generate-config`!
# This is different per machine, and hence using a machine configuration in another machine requires `hardware-configuration.nix` regeneration.
# Please run the command below to generate `hardware-configuration.nix` in the current working directory
# nixos-generate-config --show-hardware-config > hardware-configuration.nix
{
  config,
  lib,
  pkgs,
  modulesPath,
  ...
}:

{
  imports = [ ];

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
}

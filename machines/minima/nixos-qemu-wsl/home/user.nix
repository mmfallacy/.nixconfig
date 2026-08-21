top: {
  flake.nixosMachineModules.minima-nixos-qemu-wsl =
    {
      extras,
      ...
    }:
    {
      hjem.users.mmfallacy = {
        imports = [
          top.config.flake.hjemConfigs.minima-base
          top.config.flake.hjemConfigs.minima-nixos-qemu-wsl
        ];

        packages = [
          extras.nixnvim.neovim
          extras.nixnvim.opencode
        ];
      };
    };

}

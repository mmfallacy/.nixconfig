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
          extras.nixnvim.neovim.devMode
          (extras.nixnvim.opencode.override {
            xdgConfig = "/home/mmfallacy/.nixnvim";
          })
        ];
      };
    };

}

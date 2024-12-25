inputs @ {self, config, pkgs, ... }: let
  modules.system = import ../../system inputs;
in {
  imports = [
    modules.system.base
    modules.system.pipewire
    modules.system.grub
    ./hardware-configuration.nix
    ./user.nix
  ];

  config.modules.grub.enable = true;
  config.modules.pipewire.enable = true;

}

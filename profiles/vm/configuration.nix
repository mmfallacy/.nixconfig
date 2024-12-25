inputs @ {self, config, pkgs, ... }: let
  modules.system = import ../../system inputs;
in {
  imports = [
    modules.system.base
    modules.system.audio.pipewire
    modules.system.boot.grub
    ./hardware-configuration.nix
    ./user.nix
  ];

}

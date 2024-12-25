{self, config, pkgs, ... }:

{
  imports = [
    ../../modules/system/base.nix
    ../../modules/system/grub.nix
    ../../modules/system/pipewire.nix
    ./hardware-configuration.nix
    ./user.nix
  ];

  config.modules.grub.enable = true;
  config.modules.pipewire.enable = true;

}

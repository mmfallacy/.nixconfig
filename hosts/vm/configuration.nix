{config, lib, pkgs, R, ...}: {
  imports = [
    (R "/modules/system/base.nix")
    (R "/modules/system/grub.nix")
    (R "/modules/audio/pipewire.nix")
    ./user.nix
  ];
  config.modules.grub.enable = true;
  config.modules.pipewire.enable = true;
}

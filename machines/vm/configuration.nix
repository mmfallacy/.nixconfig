inputs @ {self, config, pkgs, ... }: let
  modules.system = import ../../system inputs;
in {
  imports = [
    modules.system.base
    modules.system.audio.pipewire
    modules.system.boot.grub
    modules.system.locales.en_PH
    modules.system.login.gdm
    modules.system.wm.gnome
    ./hardware-configuration.nix
    ./user.nix
  ];

  time.timeZone = "Asia/Manila";
  networking.hostName = "MMFALLACY-NixVM";
  virtualisation.vmware.guest.enable = true;
}

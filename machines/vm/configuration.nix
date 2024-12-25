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
  virtualisation.vmware.guest.enable = true;

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  home-manager.users.mmfallacy = {
    home.packages = with pkgs; [ cowsay ];
    home.stateVersion = "24.05";
  };
}

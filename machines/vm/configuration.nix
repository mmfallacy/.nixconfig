inputs @ {self, config, pkgs, extras, ... }: let
  modules.system = import ../../system inputs;

  profiles = import ../../profiles;
  inherit (profiles) mmfallacy;
  inherit (mmfallacy.const) username name;
in {
  imports = [
    modules.system.base
    modules.system.audio.pipewire
    modules.system.boot.grub
    modules.system.locales.en_PH
    modules.system.login.gdm
    modules.system.wm.gnome
    ./hardware-configuration.nix
  ];

  time.timeZone = "Asia/Manila";
  networking.hostName = "MMFALLACY-NixVM";
  virtualisation.vmware.guest.enable = true;

  users.users.${username} = {
    isNormalUser = true;
    description = name;
    extraGroups = [ "networkmanager" "wheel" ];
    useDefaultShell = true;
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.${username} = import ./home.nix;
  home-manager.extraSpecialArgs = with mmfallacy; { inherit const extras; baseConfig = homeConfig;};
}

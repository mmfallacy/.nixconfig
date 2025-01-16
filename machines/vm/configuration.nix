inputs@{
  extras,
  ...
}:
let
  modules.system = import ../../system inputs;

  profiles = import ../../profiles;
  inherit (profiles) mmfallacy;
  inherit (mmfallacy.const) username name;

  themes = import ../../themes;
in
{
  imports = [
    modules.system.base
    modules.system.audio.pipewire
    modules.system.boot.grub
    modules.system.locales.en_PH
    modules.system.login.gdm
    modules.system.wm.gnome
    modules.system.wm.niri
    ./hardware-configuration.nix

    themes.catpuccin
  ];

  time.timeZone = "Asia/Manila";
  networking.hostName = "MMFALLACY-NixVM";
  virtualisation.vmware.guest.enable = true;

  users.users.${username} = {
    isNormalUser = true;
    description = name;
    extraGroups = [
      "networkmanager"
      "wheel"
    ];
    useDefaultShell = true;
  };

  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;
  home-manager.users.${username} = import ./home.nix;
  home-manager.extraSpecialArgs = with mmfallacy; {
    inherit const extras;
    baseConfig = homeConfig;
  };

  stylix.enable = true;
}

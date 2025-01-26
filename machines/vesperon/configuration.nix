{
  units,
  extras,
  ...
}:
let
  profiles = import ../../profiles;
  inherit (profiles) mmfallacy;
  inherit (mmfallacy.const) username name;
in
{
  imports = [
    units.system.base
    units.system.audio.pipewire
    units.system.boot.grub
    units.system.locales.en_PH
    # units.system.login.gdm
    # units.system.wm.gnome
    units.system.login.ly
    units.system.wm.niri
    ./hardware-configuration.nix

    units.system.nix.nh

    units.themes.catpuccin
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
    inherit const extras units;
    baseConfig = homeConfig;
  };

  stylix.enable = true;

}

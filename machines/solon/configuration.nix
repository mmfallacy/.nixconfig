{
  units,
  extras,
  ...
}:
let

  # Place specified <user profile> into scope;
  # inherit (units.profiles) <user profile>;
  # inherit (<user profile>.const) username name;
  username = "mmfallacy";
  name = "Michael M.";

in
{
  # Set up included units as well as hardware configuration
  imports = [
    ./hardware-configuration.nix
    units.system.base
    units.system.nix.nix
    units.system.audio.pipewire
    units.system.boot.grub
    units.system.locales.en_PH

    # units.system.login.gdm
    units.system.login.ly

    # Add gnome for easy recovery
    units.system.wm.gnome
    units.system.wm.niri

    units.system.nix.nh

    # Disable stylix first!
    # units.themes.catpuccin
  ];

  # Setup timezone and hostname
  time.timeZone = "Asia/Manila";
  networking.hostName = "MMFALLACY-SOLON";

  # Set ly text
  services.displayManager.ly.settings.initial_info_text = "Solon";

  # Bootstrap Linux user from <user profile>.const
  users.users.${username} =
    # with <user_profile>;
    {
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
  # Use ./home as primary entry point with <user profile>.profile as the base configuration
  home-manager.users.${username} = import ./home;

  home-manager.extraSpecialArgs =
    # with <user_profile>;
    {
      inherit extras units;
      # inherit const;
      # baseConfig = profile;
    };

  system.stateVersion = "25.05";
}

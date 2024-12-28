inputs @ {self, config, pkgs, ... }: let
  # Import modules.system to prevent ../ hell;
  modules.system = import ../../system inputs;

  # Import profiles and put a specific user into scope
  profiles = import ../../profiles inputs;
  # inherit (profiles) <user>

  # Place constants such as username, name from the profile in scope
  # inherit (<user>.const) username name;
in {
  imports = [
    # Include your system modules here
    # e.g. module.system.grub, module.system.locale.en_PH, etc.

    # Do not forget to generate your hardware configuration and import here
    # sudo nixos-generate-config --show-hardware-config > ./hardware-configuration.nix;
    ./hardware-configuration.nix
  ];

  # Set your timezone.
  time.timeZone = "Asia/Manila";

  # Set hostname
  networking.hostName = "nixos";

  # Create user based on consts
  users.users.${username} = {
    isNormalUser = true;
    description = name;
    extraGroups = [ "networkmanager" "wheel" ];
  };

  # Bootstrap home manager
  home-manager.useGlobalPkgs = true;
  home-manager.useUserPackages = true;

  # Create a new entry point that builds off on the chosen profile and pass profile information.
  # This is intended as there might be system-specific configuration overrides
  # (e.g. git signing key format, gpg key ID, ssh key path etc.)
  home-manager.users.${username} = import ./home.nix;
  home-manager.extraSpecialArgs = with mmfallacy; { inherit const; baseConfig = homeConfig; };
}

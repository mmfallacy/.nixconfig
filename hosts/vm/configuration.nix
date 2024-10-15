{config, R, pkgs, ...} @ inputs: let
  USERNAME = "mmfallacy";
in {
  imports = [
    (R "/system")
  ];

  config = {
    # Virtualization
    virtualisation.vmware.guest.enable = true;

    modules = {
        pipewire.enable = true;
        grub.enable = true;
        gnome.enable = true;
        gdm.enable = true;
        gnupg.enable = true;
    };

    # User
    users.users.${USERNAME} = {
      isNormalUser = true;
      description = "Michael M.";
      extraGroups = [ "networkmanager" "wheel" ];
    };
    networking.hostName = USERNAME;

    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.extraSpecialArgs = {inherit inputs;};
    home-manager.users.${USERNAME} = {
      home.packages = with pkgs; [
        kitty
      ];
      home.stateVersion = "24.05";
    };
  };
}

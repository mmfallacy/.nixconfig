{config, R, pkgs, ...}: let
  USERNAME = "mmfallacy";
in {
  imports = [
    (R "/modules/system/base.nix")
    (R "/modules/system/grub.nix")
    (R "/modules/audio/pipewire.nix")
  ];

  config = {
    modules.grub.enable = true;
    modules.pipewire.enable = true;

    users.users.${USERNAME} = {
      isNormalUser = true;
      description = "Michael M.";
      extraGroups = [ "networkmanager" "wheel" ];
    };

    networking.hostName = USERNAME;
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.users.${USERNAME} = {
      home.packages = with pkgs; [
        kitty
      ];
      home.stateVersion = "24.05";
    };
  };
}

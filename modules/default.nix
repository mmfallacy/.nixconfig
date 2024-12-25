{ config, pkgs, lib, ... }:

{
  # Clear default packages not necessary for running Nix
  # environment.defaultPackages ships with packages by default hence the need to override them.
  environment.defaultPackages = lib.mkForce [];

  # Nix flakes
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Networking
  networking.hostName = lib.mkDefault "nixos";
  networking.networkmanager.enable = true;

  # Time and Locale
  time.timeZone = "Asia/Manila";
  i18n.defaultLocale = "en_PH.UTF-8";
  i18n.extraLocaleSettings = {
    LC_ADDRESS = "fil_PH";
    LC_IDENTIFICATION = "fil_PH";
    LC_MEASUREMENT = "fil_PH";
    LC_MONETARY = "fil_PH";
    LC_NAME = "fil_PH";
    LC_NUMERIC = "fil_PH";
    LC_PAPER = "fil_PH";
    LC_TELEPHONE = "fil_PH";
    LC_TIME = "fil_PH";
  };

  # Display Manager (Login)
  services.xserver.displayManager.gdm.enable = true;

  # Desktop Environment
  services.xserver.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  services.xserver.xkb = { layout = "us"; variant = ""; };

  # System packages
  environment.systemPackages = with pkgs; [
    neovim
    git
  ];

  system.stateVersion = "24.05";

  # Virtualization
  virtualization.vmware.guest.enable = true;
}

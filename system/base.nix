{ config, pkgs, lib, ... }:

{
  # Clear default packages not necessary for running Nix
  # environment.defaultPackages ships with packages by default hence the need to override them.
  environment.defaultPackages = [];

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

  # System packages
  environment.systemPackages = with pkgs; [
    neovim
    git
    just
  ];

  system.stateVersion = "24.05";
}

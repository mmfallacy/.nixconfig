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

  # System packages
  environment.systemPackages = with pkgs; [
    neovim
    git
  ];

  system.stateVersion = "24.05";
}

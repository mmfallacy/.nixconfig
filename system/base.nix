{
  config,
  pkgs,
  lib,
  ...
}:

{
  # Clear default packages not necessary for running Nix
  # environment.defaultPackages ships with packages by default hence the need to override them.
  environment.defaultPackages = [ ];

  # Nix flakes
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
    "pipe-operators"
  ];

  # Networking
  networking.hostName = lib.mkDefault "nixos";
  networking.networkmanager.enable = true;

  # System packages
  environment.systemPackages = with pkgs; [
    neovim
    git
    home-manager
  ];

  # Set Environment Variable
  environment.sessionVariables = {
    IS_NIXOS = 1;
  };

  programs.zsh.enable = true;
  users.defaultUserShell = pkgs.zsh;

}

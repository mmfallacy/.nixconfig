{ pkgs, units, ... }:
let
  const = import ./const.nix;
  inherit (const) username;
in
{
  _module.args = { inherit const; };

  imports = [
    units.profiles.mmfallacy.git
    units.profiles.mmfallacy.ssh
    units.profiles.mmfallacy.keychain
    units.profiles.common.shell.zsh
    units.profiles.common.shell.starship
    units.profiles.common.shell.direnv
    units.profiles.common.neovim
    units.profiles.common.kitty
  ];

  home.username = username;
  home.homeDirectory = "/home/" + username;
  home.packages = with pkgs; [ neofetch ];
  home.stateVersion = "24.11";
}

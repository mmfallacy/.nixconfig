{ pkgs, units, ... }:
let
  const = import ./const.nix;
  inherit (const) username;
in
{
  _module.args = { inherit const; };

  imports = [
    units.userprofiles.mmfallacy.git
    units.userprofiles.mmfallacy.ssh
    units.userprofiles.common.shell.zsh
    units.userprofiles.common.shell.starship
    units.userprofiles.common.shell.direnv
    units.userprofiles.common.neovim
    units.userprofiles.common.kitty
  ];

  home.username = username;
  home.homeDirectory = "/home/" + username;
  home.packages = with pkgs; [ neofetch ];
  home.stateVersion = "24.11";
}

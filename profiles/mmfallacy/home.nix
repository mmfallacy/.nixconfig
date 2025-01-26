inputs@{ pkgs, units, ... }:
let
  const = import ./const.nix;
  inherit (const) username;
in
{
  _module.args = { inherit const; };

  imports = [
    units.user.git
    units.user.shell.zsh
    units.user.shell.starship
    units.user.shell.direnv
    units.user.neovim
    units.user.kitty
  ];

  home.username = username;
  home.homeDirectory = "/home/" + username;
  home.packages = with pkgs; [ neofetch ];
  home.stateVersion = "24.11";
}

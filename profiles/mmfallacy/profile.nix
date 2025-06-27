{ pkgs, units, ... }:
let
  const = import ./const.nix;
  inherit (const) username;
in
{
  _module.args = { inherit const; };

  # TODO: Autowire all files inside profile to be automatically imported
  # Though for simplicity, I think this is enough
  imports = [
    units.profiles.mmfallacy.git
    units.profiles.mmfallacy.ssh
    units.profiles.mmfallacy.keychain
    units.profiles.mmfallacy.neovim

    units.profiles.common.shell.zsh
    units.profiles.common.shell.starship
    units.profiles.common.shell.direnv
    units.profiles.common.shell.misc
    units.profiles.common.kitty
  ];

  home.username = username;
  home.homeDirectory = "/home/" + username;
  home.packages = with pkgs; [ neofetch ];
  home.stateVersion = "24.11";
}

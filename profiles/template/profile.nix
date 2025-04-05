{ pkgs, units, ... }:
let
  # Place constants into scope
  const = import ./const.nix;
  inherit (const) username;
in
{
  # Let home-manager modules see the constants
  _module.args = { inherit const; };

  imports = [

    # Import user-level configuration from:
    # Own overrides
    # units.profiles.userprofile.program or ./program.nix

    # Common/shared user-level configs
    # units.profiles.common.program

    # Other user configs
    # units.profiles.mmfallacy.program
  ];

  # Set up home-manager meta
  home.username = username;
  home.homeDirectory = "/home/" + username;

  # Place other user-level packages here!
  home.packages = with pkgs; [ neofetch ];

  # Do not touch!!!
  home.stateVersion = "24.11";
}

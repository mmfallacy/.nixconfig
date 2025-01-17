{ config, ... }:
let
  actions = config.lib.niri.actions;
  Mod = "Mod";
in
{
  imports = [
    ./default-binds.nix
  ];

  # Override defaults
  programs.niri.settings.binds = {
    "${Mod}+T".action = actions.spawn "kitty";
  };
}

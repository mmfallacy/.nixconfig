{ config, pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    # This setting is configured by stylix in which wallpaper colors are used.
    # The following attrset is merely merged with the stylix module defaults.
    theme =
      let
        inherit (config.lib.formats.rasi) mkLiteral;
      in
      {
        window.padding = 8;
        listview.spacing = mkLiteral "0.25em";
        listview.padding = mkLiteral "0.25em 0px 0px";
        element.padding = mkLiteral "0.25em";
        inputbar.padding = mkLiteral "0.25em";
      };
  };
}

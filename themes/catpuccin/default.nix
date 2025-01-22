{
  config,
  pkgs,
  extras,
  ...
}:
{
  stylix.base16Scheme = {
    # scheme: "Catppuccin Macchiato"
    # author: "https://github.com/catppuccin/catppuccin"
    base00 = "24273a"; # #24273a base
    base01 = "1e2030"; # #1e2030 mantle
    base02 = "363a4f"; # #363a4f surface0
    base03 = "494d64"; # #494d64 surface1
    base04 = "5b6078"; # #5b6078 surface2
    base05 = "cad3f5"; # #cad3f5 text
    base06 = "f4dbd6"; # #f4dbd6 rosewater
    base07 = "b7bdf8"; # #b7bdf8 lavender
    base08 = "ed8796"; # #ed8796 red
    base09 = "f5a97f"; # #f5a97f peach
    base0A = "eed49f"; # #eed49f yellow
    base0B = "a6da95"; # #a6da95 green
    base0C = "8bd5ca"; # #8bd5ca teal
    base0D = "8aadf4"; # #8aadf4 blue
    base0E = "c6a0f6"; # #c6a0f6 mauve
    base0F = "f0c6c6"; # #f0c6c6 flamingo
  };

  stylix.image = ./wallpaper.jpg;

  stylix.cursor.package = pkgs.bibata-cursors;
  stylix.cursor.name = "Bibata-Modern-Ice";
  stylix.cursor.size = 24;

  stylix.fonts = {
    sansSerif = {
      package = extras.mypkgs.font-space-grotesk { follows = pkgs; };
      name = "SpaceGrotesk";
    };

    monospace = {
      package = pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; };
      name = "JetBrainsMono Nerd Font Mono";
    };

    sizes.terminal = 18;
  };
  # Based https://github.com/termbox/termbox2/blob/master/termbox2.h
  # Use blue (5) equivalent color in scheme
  services.displayManager.ly.settings.cmatrix_fg = 5;

}

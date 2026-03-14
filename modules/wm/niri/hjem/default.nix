{
  flake.hjemModules.niri =
    { pkgs, ... }:
    {

      xdg.config.files."niri/config.kdl".text = # kdl
        ''
          binds {
            Mod+T { spawn "kitty"; }
            Mod+Q repeat=false { close-window; }
            
            Mod+H { focus-column-left; }
            Mod+J { focus-window-down; }
            Mod+K { focus-window-up; }
            Mod+L { focus-column-right; }

            Mod+Ctrl+H { move-column-left; }
            Mod+Ctrl+J { move-window-down; }
            Mod+Ctrl+K { move-window-up; }
            Mod+Ctrl+L { move-column-right; }

            Mod+i { focus-column-first; }
            Mod+a { focus-column-last; }

            Mod+f { maximize-column; }

            Mod+Shift+Slash { show-hotkey-overlay; }
            Mod+Shift+E { quit; }
          }
        '';
    };
}

{
  flake.hjemModules.niri =
    {
      config,
      pkgs,
      lib,
      ...
    }:
    let
      defaultEnv = {
        TERMINAL = "kitty";
        FLAKE = "${config.directory}/.nixconfig";
      };

      env = defaultEnv // config.environment.sessionVariables;

      Mod = "Mod";
    in
    {

      xdg.config.files."niri/config.kdl".text = # kdl
      ''
        binds {
          ${Mod}+T repeat=false { spawn "${env.TERMINAL}"; }
          ${Mod}+Shift+T repeat=false { spawn "${env.TERMINAL}" "-d" "${env.FLAKE}"; }

          ${Mod}+Q repeat=false { close-window; }
          ${Mod}+Shift+E { quit; }
          
          ${Mod}+H repeat=false { focus-column-left; }
          ${Mod}+J repeat=false { focus-window-down; }
          ${Mod}+K repeat=false { focus-window-up; }
          ${Mod}+L repeat=false { focus-column-right; }

          ${Mod}+Ctrl+H repeat=false { move-column-left; }
          ${Mod}+Ctrl+J repeat=false { move-window-down; }
          ${Mod}+Ctrl+K repeat=false { move-window-up; }
          ${Mod}+Ctrl+L repeat=false { move-column-right; }

          ${Mod}+I repeat=false { focus-column-first; }
          ${Mod}+A repeat=false { focus-column-last; }

          ${Mod}+Comma repeat=false { consume-window-into-column; }
          ${Mod}+Period repeat=false { expel-window-from-column; }
          ${Mod}+F repeat=false { maximize-column; }
          ${Mod}+Shift+F repeat=false { fullscreen-window; }

          ${Mod}+Minus repeat=false { set-column-width "-10%"; }
          ${Mod}+Equal repeat=false { set-column-width "+10%"; }
          ${Mod}+Shift+Minus repeat=false { set-window-height "-10%"; }
          ${Mod}+Shift+Equal repeat=false { set-window-height "+10%"; }

          ${Mod}+Shift+Slash { show-hotkey-overlay; }
      ''
      # Per workspace binds
      + lib.concatLines (
        let
          ts = builtins.toString;
          workspaces = lib.range 1 9;
        in
        builtins.map (i: ''
          ${Mod}+${ts i} repeat=false { focus-workspace ${ts i}; }
          ${Mod}+Ctrl+${ts i} repeat=false { move-column-to-workspace ${ts i}; }
        '') workspaces
      )
      + "\n}";
    };
}

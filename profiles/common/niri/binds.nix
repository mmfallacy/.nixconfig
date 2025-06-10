{ config, lib, ... }:
let
  actions = config.lib.niri.actions;
  Mod = "Mod";
in
{
  # Scrap usage of ./default-binds.nix
  # I do not want to adopt default bindings. Only include keybinds I want to use
  programs.niri.settings.binds =
    {
      # Start
      "${Mod}+T".action = actions.spawn "kitty";
      "${Mod}+Q".action = actions.close-window;
      "${Mod}+Shift+E".action = actions.quit;

      #Window Movements
      "${Mod}+h".action = actions.focus-column-left;
      "${Mod}+l".action = actions.focus-column-right;
      "${Mod}+k".action = actions.focus-window-up;
      "${Mod}+j".action = actions.focus-window-down;

      "${Mod}+Ctrl+h".action = actions.move-column-left;
      "${Mod}+Ctrl+l".action = actions.move-column-right;
      "${Mod}+Ctrl+k".action = actions.move-window-up;
      "${Mod}+Ctrl+j".action = actions.move-window-down;

      "${Mod}+i".action = actions.focus-column-first;
      "${Mod}+a".action = actions.focus-column-last;

      "${Mod}+Comma".action = actions.consume-window-into-column;
      "${Mod}+Period".action = actions.expel-window-from-column;

      "${Mod}+V".action = actions.toggle-window-floating;

      # Size Adjustments
      "${Mod}+Minus".action = actions.set-column-width "-10%";
      "${Mod}+Equal".action = actions.set-column-width "+10%";
      "${Mod}+Shift+Minus".action = actions.set-window-height "-10%";
      "${Mod}+Shift+Equal".action = actions.set-window-height "+10%";

      "${Mod}+f".action = actions.maximize-column;
      "${Mod}+Shift+f".action = actions.fullscreen-window;

      # Hotkey Overlay
      "${Mod}+Shift+Slash".action = actions.show-hotkey-overlay;

    }
    // (
      # Workspace binds
      # map attrset to range [1...9]
      let
        # We cannot straight coalesce an integer to a string, for brevity we alias builtins.toString
        ts = builtins.toString;
        per-workspace-binds =
          lib.range 1 9
          |> builtins.map (i: {
            "${Mod}+${ts i}".action = actions.focus-workspace i;

            # Currently, this option only works for niri-stable.
            # Why? niri-master introduces a new parameter for  MoveColumnToWorkspace [niri/main#L360](https://github.com/YaLTeR/niri/blob/242ebf294514cc22f4f9d83c0566c8ffe1cb8d8a/niri-ipc/src/lib.rs#L360). This completely breaks sodiboo/niri-flake due to  a [regex parsing issue](https://github.com/sodiboo/niri-flake/commit/a7949bd0f5551fdfffd04cb9735ad3cd3167d624), hence it is removed temporarily in commit bb8dc85.
            # TODO: Either do a PR or an overlay to temporarily fix this. Optionally, you can wait for sodiboo to fix it. Also, explore PR#1078 which temporarily revamps parse-binds.nix.

            # "${Mod}+Ctrl+${ts i}".action = actions.move-column-to-workspace i
          });
      in
      lib.mergeAttrsList per-workspace-binds
    );
}

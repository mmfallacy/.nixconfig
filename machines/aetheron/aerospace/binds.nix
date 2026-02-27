{
  inputs,
  pkgs,
  ...
}:
{
  services.aerospace.settings = {
    mode.main.binding =
      let
        ts = builtins.toString;
        per-workspace-keybinds = builtins.map (i: {
          "cmd-${ts i}" = "workspace ${ts i}";
          "cmd-shift-${ts i}" = "move-node-to-workspace ${ts i}";
        }) (pkgs.lib.range 1 9);
      in
      {
        cmd-h = "focus left";
        cmd-j = "focus down";
        cmd-k = "focus up";
        cmd-l = "focus right";

        cmd-shift-h = "move left";
        cmd-shift-j = "move down";
        cmd-shift-k = "move up";
        cmd-shift-l = "move right";

        cmd-minus = "resize smart -50";
        cmd-equal = "resize smart +50";

        cmd-tab = "workspace-back-and-forth";
      }
      // pkgs.lib.mergeAttrsList per-workspace-keybinds;
    mode.service.binding = {
      esc = [
        "reload-config"
        "mode main"
      ];
      r = [
        "flatten-workspace-tree"
        "mode main"
      ];
      f = [
        "layout floating tiling"
        "mode main"
      ];
      backspace = [
        "close-all-windows-but-current"
        "mode main"
      ];

      cmd-shift-h = [
        "join-with left"
        "mode main"
      ];
      cmd-shift-j = [
        "join-with down"
        "mode main"
      ];
      cmd-shift-k = [
        "join-with up"
        "mode main"
      ];
      cmd-shift-l = [
        "join-with right"
        "mode main"
      ];
    };
  };
}

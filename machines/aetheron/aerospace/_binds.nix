{
  pkgs,
  ...
}:
{
  services.aerospace.settings = {
    enable-normalization-flatten-containers = false;
    enable-normalization-opposite-orientation-for-nested-containers = false;
    mode.main.binding =
      let
        ts = builtins.toString;
        per-workspace-keybinds = builtins.map (i: {
          "alt-${ts i}" = "workspace ${ts i}";
          "alt-shift-${ts i}" = "move-node-to-workspace ${ts i}";
        }) (pkgs.lib.range 1 9);
      in
      {
        alt-j = "focus --boundaries-action wrap-around-the-workspace left";
        alt-k = "focus --boundaries-action wrap-around-the-workspace down";
        alt-l = "focus --boundaries-action wrap-around-the-workspace up";
        alt-semicolon = "focus --boundaries-action wrap-around-the-workspace right";

        alt-h = "split horizontal";
        alt-v = "split vertical";
        alt-f = "fullscreen";

        alt-shift-h = "move left";
        alt-shift-j = "move down";
        alt-shift-k = "move up";
        alt-shift-l = "move right";

        alt-minus = "resize smart -50";
        alt-equal = "resize smart +50";

        alt-tab = "workspace-back-and-forth";

        alt-e = "layout tiles horizontal vertical";
        alt-shift-space = "layout floating tiling";

        alt-shift-semicolon = "mode service";
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

      alt-shift-h = [
        "join-with left"
        "mode main"
      ];
      alt-shift-j = [
        "join-with down"
        "mode main"
      ];
      alt-shift-k = [
        "join-with up"
        "mode main"
      ];
      alt-shift-l = [
        "join-with right"
        "mode main"
      ];
    };
  };
}

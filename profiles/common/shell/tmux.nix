{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    mouse = true;
    keyMode = "vi";
    clock24 = true;
    baseIndex = 1; # 0 is too far

    extraConfig = ''
      setw -g automatic-rename on
      set -g set-titles on

      set -g window-style "bg=terminal"
      set -g window-active-style "bg=terminal"

      bind x split-window -h
      bind v split-window -v
    '';
  };

  programs.tmux.plugins = with pkgs.tmuxPlugins; [
    yank # tmux-yank: copy to system clipboard

  ];
}

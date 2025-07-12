{ pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    terminal = "tmux-256color";
    mouse = true;
    prefix = "C-Space";
    keyMode = "vi";
    clock24 = true;
    baseIndex = 1; # 0 is too far

    extraConfig = ''
      # zsh
      set -g default-terminal "tmux-256color"
      set -ag terminal-overrides ",xterm-256color:RGB"

      # Auto rename
      setw -g automatic-rename on
      set -g set-titles on

      # Window styling
      set -g window-style "bg=terminal"
      set -g window-active-style "bg=terminal"

      # Splits
      bind x split-window -h
      bind v split-window -v
    '';
  };

  programs.tmux.plugins = with pkgs.tmuxPlugins; [
    yank # tmux-yank: copy to system clipboard

  ];
}

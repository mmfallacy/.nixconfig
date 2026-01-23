{ pkgs, extras, ... }:
{
  imports = [
    ./keybinds.nix
  ];

  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      simplified_ui = true;
      default_layout = "compact";
      default_mode = "locked";
      show_startup_tips = false;
      pane_frames = false;
      on_force_close = "quit";
    };
    exitShellOnExit = true;

    extraConfig = ''
      plugins {
        compact-bar location="zellij:compact-bar" {
          tooltip "F1"
        }
      }
    '';

  };
}

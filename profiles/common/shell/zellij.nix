{ pkgs, ... }:
{
  programs.zellij = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      simplified_ui = true;
      # default_layout = "compact";
      show_startup_tips = false;
      pane_frames = false;
    };

  };
}

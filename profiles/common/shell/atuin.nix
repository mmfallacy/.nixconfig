{ pkgs, ... }:
{
  programs.atuin = {
    enable = true;
    settings = {
      auto_sync = false;
      keymap_mode = "vim-insert";
      # Use <C-1> to <C-9> to navigate instead of <A-1> to <A-9>
      ctrl_n_shortcuts = true;
      workspaces = true;
    };
    flags = [
      "--disable-up-arrow"
      "--disable-ctrl-r"
    ];
  };

  programs.zsh.initContent =
    pkgs.lib.mkAfter # bash
      ''
        # Use vim-normal "/" or vim-insert "<A-/>" instead!
        bindkey -M vicmd '/' atuin-search
      '';
}

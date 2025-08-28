{ ... }:
{
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      auto_sync = false;
      search_mode = "prefix";
      keymap_mode = "vim-normal";
      # Use <C-1> to <C-9> to navigate instead of <A-1> to <A-9>
      ctrl_n_shortcuts = true;
    };
    flags = [
      # Use vim-normal "/" or vim-insert "<A-/>" instead!
      "--disable-up-arrow"
      "--disable-ctrl-r"
    ];
  };
}

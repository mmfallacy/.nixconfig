{ ... }:
{
  programs.atuin = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      auto_sync = false;
      search_mode = "prefix";
      keymap_mode = "vim-normal";
    };
    flags = [ "--disable-up-arrow" ];
  };
}

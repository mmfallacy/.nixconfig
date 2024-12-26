{ const, ... } : {
  programs.git.enable = true;

  programs.git.username = const.username;
}

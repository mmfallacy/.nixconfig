{ const , pkgs , ... } : {
  home.packages = with pkgs; [ git ];
  programs.git = {
    enable = true;

    userName = const.username;
    userEmail = const.email;
  };
}

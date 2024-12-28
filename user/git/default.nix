{ const , pkgs , ... } : {
  home.packages = with pkgs; [ git ];
  programs.git = {
    enable = true;

    userName = const.username;
    userEmail = const.email;

    signing.key = "~/.ssh/id_ed25519";
    signing.signByDefault = true;
    extraConfig.gpg.format = "ssh";

  };
}

{ pkgs, ... } : let
  plug = pkg: { name = pkg.pname; src = pkg.src; };
in {
  # Dependency of zsh-fzf-tab
  programs.fzf.enable = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;

    plugins = with pkgs; builtins.map plug [
      zsh-autopair
      zsh-defer
      zsh-fzf-tab
    ];

    initExtra = ''
      zsh-defer source ${pkgs.zsh-fzf-tab}/share/fzf-tab/fzf-tab.plugin.zsh
    '';

  };
}

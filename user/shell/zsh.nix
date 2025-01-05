{ pkgs, ... } : let
  plug = pkg: { name = pkg.pname; src = pkg.src; };
in {
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    plugins = with pkgs; builtins.map plug [
    ];
  };
}

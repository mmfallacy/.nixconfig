top:
{ pkgs, lib, ... }:
[
  {
    name = "zsh-autopair";
    source = pkgs.zsh-autopair;
  }

  {
    name = "zsh-fzf-tab";
    source = pkgs.zsh-fzf-tab;
    file = "fzf-tab";
    deps = with top.config.flake.hjemModules; [ fzf ];
  }

  {
    name = "zsh-vi-mode";
    source = pkgs.zsh-vi-mode;
  }
]

{ ... } : {
  git = ./git;
  shell = {
    zsh = ./shell/zsh.nix;
    starship = ./shell/starship.nix;
  };
}

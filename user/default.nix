{ ... }:
{
  git = ./git;
  shell = {
    zsh = ./shell/zsh.nix;
    starship = ./shell/starship.nix;
  };
  neovim = ./neovim;
  niri = ./niri;
  ssh = ./ssh.nix;
}

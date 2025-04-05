rec {
  username = "nixos-user";
  name = username;
  email = "some_email@domain.tld";
  defaultEditor = "nvim";
  # Where the dotfiles are situated relative from $HOME;
  dotfiles = ".nixconfig";
}

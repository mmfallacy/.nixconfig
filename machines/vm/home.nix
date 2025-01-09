inputs @ { lib , pkgs , baseConfig , const ,... }: {
  imports = [
    baseConfig
  ];

  home.sessionVariables = rec {
    DOTFILES_PATH = with const; "/home/${username}/${dotfiles}";
    FLAKE =  DOTFILES_PATH;
  };
}

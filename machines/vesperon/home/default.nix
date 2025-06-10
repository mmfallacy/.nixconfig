{
  baseConfig,
  const,
  ...
}:
{
  imports = [
    baseConfig

    ./niri.nix
  ];

  home.sessionVariables = rec {
    DOTFILES_PATH = with const; "/home/${username}/${dotfiles}";
    FLAKE = DOTFILES_PATH;
    NH_FLAKE = DOTFILES_PATH;
    TERMINAL = "kitty";
  };

}

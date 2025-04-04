{
  pkgs,
  baseConfig,
  const,
  units,
  ...
}:
{
  imports = [
    baseConfig
    units.user.niri
  ];

  home.sessionVariables = rec {
    DOTFILES_PATH = with const; "/home/${username}/${dotfiles}";
    FLAKE = DOTFILES_PATH;
    TERMINAL = "kitty";
  };

}

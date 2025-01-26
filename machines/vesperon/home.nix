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
    units.user.ssh
  ];

  home.sessionVariables = rec {
    DOTFILES_PATH = with const; "/home/${username}/${dotfiles}";
    FLAKE = DOTFILES_PATH;
    TERMINAL = "kitty";
  };

}

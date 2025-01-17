inputs@{
  pkgs,
  baseConfig,
  const,
  ...
}:
let
  modules.user = import ../../user inputs;
in
{
  imports = [
    baseConfig
    modules.user.niri
    modules.user.ssh
  ];

  home.sessionVariables = rec {
    DOTFILES_PATH = with const; "/home/${username}/${dotfiles}";
    FLAKE = DOTFILES_PATH;
    TERMINAL = "kitty";
  };

  home.packages = [ pkgs.kitty ];

}

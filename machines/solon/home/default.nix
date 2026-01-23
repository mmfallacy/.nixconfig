{
  baseConfig,
  const,
  pkgs,
  ...
}:
{
  imports = [
    # Import baseConfig to allow for extension
    # baseConfig

    # Add machine-specific override files here!
  ];

  # Set up session variables
  home.sessionVariables = rec {
    DOTFILES_PATH = with const; "/home/${username}/${dotfiles}";
    FLAKE = DOTFILES_PATH;
  };

  home.packages = [
    pkgs.neovim
  ];

}

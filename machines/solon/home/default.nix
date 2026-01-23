{
  baseConfig,
  const,
  pkgs,
  units,
  ...
}:
{
  imports = [
    # Import baseConfig to allow for extension
    # baseConfig

    # Add machine-specific override files here!
    units.profiles.mmfallacy.neovim
    units.profiles.mmfallacy.git
  ];

  # Set up session variables
  home.sessionVariables = rec {
    DOTFILES_PATH = with const; "/home/${username}/${dotfiles}";
    FLAKE = DOTFILES_PATH;
  };

  home.packages = [
  ];

}

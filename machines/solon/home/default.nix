{
  baseConfig,
  const,
  pkgs,
  extras,
  units,
  ...
}:
{
  imports = [
    # Import baseConfig to allow for extension
    # baseConfig

    # Add machine-specific override files here!
    # units.profiles.mmfallacy.neovim
    # units.profiles.mmfallacy.git
  ];

  # Set up session variables
  home.sessionVariables = rec {
    DOTFILES_PATH = with const; "/home/${username}/.nixconfig";
    FLAKE = DOTFILES_PATH;
    NH_FLAKE = DOTFILES_PATH;
  };

  home.packages = [
    pkgs.git
    extras.nixnvim.neovim
  ];

  home.stateVersion = "25.05";
}

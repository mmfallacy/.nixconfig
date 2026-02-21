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
    units.profiles.common.kitty
    units.profiles.common.shell.zsh
    # units.profiles.common.niri
  ];

  programs.git.enable = true;
  custom.multi-user-git = {
    enable = true;
    users = [
      {
        username = "mmfallacy";
        email = "31348500+mmfallacy@users.noreply.github.com";
        signingKey = "~/.ssh/id_ed25519";
        authKey = "~/.ssh/id_ed25519";
      }
    ];
  };

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

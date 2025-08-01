{ pkgs, ... }:
let
  # Generate home-manager plugin entry given the package.
  plug = pkg: rec {
    name = pkg.pname;
    src = pkg.src;
    # If pkg has file use it otherwise use default name.
    file = if pkg ? file then pkg.file else "${name}.plugin.zsh";
  };

  # By default home-manager resolve zsh-<name> plugins by sourcing share/zsh-<name>/zsh-<name>.plugin.zsh;
  # This attrset allows me to specify the file, and add other attributes while keeping plug interop
  my = {
    zsh-fzf-tab = pkgs.zsh-fzf-tab // {
      file = "fzf-tab.plugin.zsh";
    };
  };
in
{
  # Dependency of zsh-fzf-tab
  programs.fzf.enable = true;

  programs.zsh = {
    enable = true;
    enableCompletion = true;

    # Map plugin entries to plug to create valid home-manager plugin entries
    plugins =
      with pkgs;
      builtins.map plug [
        zsh-autopair
        my.zsh-fzf-tab
        zsh-vi-mode
      ];

    shellAliases = {
      ndr = "nix-direnv-reload";
    };
  };

  # Enable direnv integration
  programs.direnv.enableZshIntegration = true;

  # Enable any-nix-shell
  home.packages = [
    pkgs.any-nix-shell
  ];

  programs.zsh.initContent = ''
    ${pkgs.any-nix-shell}/bin/any-nix-shell zsh --info-right | source /dev/stdin
  '';

}

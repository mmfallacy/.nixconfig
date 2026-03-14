{
  flake.hjemModules.direnv =
    {
      pkgs,
      lib,
      ...
    }:
    {
      packages = [ pkgs.direnv ];

      files.".zshrc".text = # bash
        ''
          # Direnv
          source "${pkgs.nix-direnv}/share/nix-direnv/direnvrc"
          eval "$(${lib.getExe pkgs.direnv} hook zsh)"

          alias ndr="nix-direnv-reload"
        '';

    };
}

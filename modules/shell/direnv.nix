{
  flake.hjemModules.direnv =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      options.custom.home.direnv.enable = lib.mkEnableOption "home.direnv";

      config = lib.mkIf config.custom.home.direnv.enable {
        packages = [ pkgs.direnv ];

        files.".zshrc".text = # bash
          ''
            # Direnv
            source "${pkgs.nix-direnv}/share/nix-direnv/direnvrc"
            eval "$(${lib.getExe pkgs.direnv} hook zsh)"

            alias ndr="nix-direnv-reload"
          '';
      };
    };
}

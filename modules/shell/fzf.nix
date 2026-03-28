{
  flake.hjemModules.fzf =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      options.custom.home.fzf.enable = lib.mkEnableOption "home.fzf";

      config = lib.mkIf config.custom.home.fzf.enable {
        packages = [ pkgs.fzf ];
        files.".zshrc".text = # bash
          ''
            if [[ $options[zle] = on ]]; then
                source <(${lib.getExe pkgs.fzf} --zsh)
            fi
          '';
      };
    };
}

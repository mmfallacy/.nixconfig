{
  flake.hjemModules.fzf =
    {
      pkgs,
      lib,
      ...
    }:
    {
      packages = [ pkgs.fzf ];
      files.".zshrc".text = # bash
        ''
          if [[ $options[zle] = on ]]; then
              source <(${lib.getExe pkgs.fzf} --zsh)
          fi
        '';
    };
}

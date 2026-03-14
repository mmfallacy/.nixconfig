{
  flake.hjemModules.hstr =
    {
      pkgs,
      ...
    }:
    {
      packages = [ pkgs.hstr ];
      files.".zshrc".text = # bash
        ''
          eval "$(${pkgs.hstr}/bin/hstr --show-zsh-configuration)"
        '';
    };
}

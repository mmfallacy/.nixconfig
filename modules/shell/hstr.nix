{
  flake.hjemModules.hstr =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      options.custom.home.hstr.enable = lib.mkEnableOption "home.hstr";

      config = lib.mkIf config.custom.home.hstr.enable {
        packages = [ pkgs.hstr ];
        files.".zshrc".text = # bash
          ''
            eval "$(${pkgs.hstr}/bin/hstr --show-zsh-configuration)"
          '';
      };
    };
}

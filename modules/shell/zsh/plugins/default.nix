{
  flake.hjemModules.zsh =
    { config, lib, ... }:
    {
      config = lib.mkIf config.custom.home.zsh.enable {
        files.".zshrc".text = # bash
          ''
            source "$HOME/.zsh/.zshplugins"
          '';
      };
    };
}

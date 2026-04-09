{
  flake.hjemModules.zsh =
    {
      config,
      pkgs,
      lib,
      ...
    }:
    let
      PLUGINS_DIR = ".zsh/plugins";
    in
    {
      config = lib.mkIf config.custom.home.zsh.enable {
        # source files
        files."${PLUGINS_DIR}/zsh-autopair".source = pkgs.zsh-autopair;

        # load
        files.".zsh/.zshplugins".text = # bash
          ''
            path+="$HOME/${PLUGINS_DIR}/zsh-autopair"
            fpath+="$HOME/${PLUGINS_DIR}/zsh-autopair"

            plugin_path="$HOME/${PLUGINS_DIR}/zsh-autopair/share/zsh/zsh-autopair/autopair.zsh"
            [[ -f "$plugin_path" ]] && source "$plugin_path"
            unset plugin_path
          '';

        # dependencies
      };
    };
}

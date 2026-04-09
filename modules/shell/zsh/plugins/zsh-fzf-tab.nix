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
        files."${PLUGINS_DIR}/zsh-fzf-tab".source = pkgs.zsh-fzf-tab;

        # load
        files.".zsh/.zshplugins".text = # bash
          ''
            # source files
              path+="$HOME/${PLUGINS_DIR}/zsh-fzf-tab"
              fpath+="$HOME/${PLUGINS_DIR}/zsh-fzf-tab"

              plugin_path="$HOME/${PLUGINS_DIR}/zsh-fzf-tab/share/fzf-tab/fzf-tab.plugin.zsh"
              [[ -f "$plugin_path" ]] && source "$plugin_path"
              unset plugin_path
          '';

        # dependencies
        custom.home.fzf.enable = true;

      };
    };
}

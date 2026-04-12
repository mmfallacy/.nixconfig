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
            plugin_src="$HOME/${PLUGINS_DIR}/zsh-fzf-tab"

            path+="$plugin_src"
            fpath+="$plugin_src"

            plugin_entry="$plugin_src/share/fzf-tab/fzf-tab.plugin.zsh"
            [[ -f "$plugin_entry" ]] && source "$plugin_entry"

            unset plugin_entry plugin_src
          '';

        # dependencies
        custom.home.fzf.enable = true;

      };
    };
}

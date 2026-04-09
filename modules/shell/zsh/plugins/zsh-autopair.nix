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

        # load last
        files.".zsh/.zshplugins".text =
          lib.mkAfter
            # bash
            ''
              plugin_src="$HOME/${PLUGINS_DIR}/zsh-autopair"

              path+="$plugin_src"
              fpath+="$plugin_src"

              plugin_entry="$plugin_src/share/zsh/zsh-autopair/autopair.zsh"
              [[ -f "$plugin_entry" ]] && source "$plugin_entry"

              unset plugin_entry plugin_src
            '';

        # dependencies
      };
    };
}

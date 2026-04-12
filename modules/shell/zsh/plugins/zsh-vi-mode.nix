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
        files."${PLUGINS_DIR}/zsh-vi-mode".source = pkgs.zsh-vi-mode;

        # load
        files.".zsh/.zshplugins".text = # bash
          ''
            plugin_src="$HOME/${PLUGINS_DIR}/zsh-vi-mode"

            path+="$plugin_src"
            fpath+="$plugin_src"

            plugin_entry="$plugin_src/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh"

            # ZVM Configuration
            function zvm_config() {
              ZVM_SYSTEM_CLIPBOARD_ENABLED=true
              ZVM_VI_SURROUND_BINDKEY=s-prefix
            }

            # load immediately to fix overriding plugin keybinds
            ZVM_INIT_MODE=sourcing
            [[ -f "$plugin_entry" ]] && source "$plugin_entry"

            unset plugin_entry plugin_src
          '';

        # dependencies

      };
    };
}

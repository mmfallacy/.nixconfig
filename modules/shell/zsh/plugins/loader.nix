top: {
  flake.hjemModules.zsh =
    {
      config,
      lib,
      ...
    }@inputs:
    let
      zshPlugins = import ./_plugins.nix top inputs;
      pmap = map (plugin: {
        ".zsh/plugins/${plugin.name}".source = plugin.source;
      });
      reduce = lib.foldl' (a: b: a // b) { };
    in
    {
      config =
        lib.mkIf config.custom.home.zsh.enable {
          files = lib.pipe zshPlugins [
            pmap
            reduce
          ];
        }
        // {

          imports = lib.pipe zshPlugins [
            (map (plugin: if plugin ? deps then plugin.deps else [ ]))
            lib.flatten
          ];

          files.".zsh/.zshplugins".text =
            let
              join = lib.concatStringsSep "\n";
              init = # bash
                ''
                  # test
                '';

              pPathFpathMap = map (
                raw:
                let
                  # transform
                  plugin = raw // {
                    file = if raw ? file then raw.file else raw.name;
                  };
                in
                # bash
                ''
                  path+="$HOME/.zsh/plugins/${plugin.name}"
                  fpath+="$HOME/.zsh/plugins/${plugin.name}"

                  if [[ -f "$HOME/.zsh/plugins/${plugin.name}/${plugin.file}.zsh" ]]; then
                    source "$HOME/.zsh/plugins/${plugin.name}/${plugin.file}.zsh"
                  fi
                ''
              );

            in
            join [
              init
              # Build out path and fpath
              (join (pPathFpathMap zshPlugins))
            ];

          files.".zshrc".text = # bash
            ''
              # Link zsh plugins config
              source "$HOME/.zsh/.zshplugins"
            '';
        };
    };
}

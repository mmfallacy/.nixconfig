{
  flake.hjemModules.zsh =
    { lib, ... }:
    let
      plugins = [ ];
      pmap = map (plugin: {
        ".zsh/plugins/${plugin.name}".source = plugin.source;
      });
      reduce = lib.foldl' (a: b: a // b) { };
    in
    {
      files = lib.pipe plugins [
        pmap
        reduce
      ];
    };
}

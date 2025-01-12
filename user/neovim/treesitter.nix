# This file handles nvim-treesitter's parsers.
# To install a parser, include it in the array of the grammars variable.
# To install nvim-treesitter, include it as part of ./plugins.nix;
{
  lib,
  pkgs,
  extras
} : let
  inherit (pkgs.vimPlugins) nvim-treesitter;
  # nvim-treesitter provides us a neat way of creating a derivation of nvim-treesitter
  # either withAllGrammars or via withPlugins where we specify the grammars we include.
  TSwithAllGrammars = nvim-treesitter.withAllGrammars;

  TSwithGrammars = nvim-treesitter.withPlugins (grammar: with grammar;
    # This array basically contains treesitter's ensure_installed
    # The following are based off of LazyVim's default ensure_installed.
    [
      bash c diff html javascript jsdoc json jsonc lua luadoc
      luap markdown markdown_inline printf python query regex
      toml tsx typescript vim vimdoc xml yaml
  ]);

# This derivation places all parsers in $out/parser/
# Keep this in mind when setting the parser_install_dir in treesitter config
in pkgs.symlinkJoin {
  name = "nvim-treesitter-grammars";
  # We then get the actual parsers from the nvim-treesitter drv variations via its dependecies;
  paths = TSwithGrammars.dependencies;
}



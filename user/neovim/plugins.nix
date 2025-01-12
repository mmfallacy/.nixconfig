{ pkgs, extras } :
with pkgs.vimPlugins;
[
  lazy-nvim

  # Common Dependencies
  plenary-nvim

  # Plugins
  oil-nvim
  gitsigns-nvim
  indent-blankline-nvim

  # blink-cmp and other snippet sources
  blink-cmp
  friendly-snippets

  # Mini.nvim
  mini-ai
  mini-cursorword
  mini-files
  mini-hipatterns
  mini-indentscope
  mini-pairs
  mini-splitjoin
  mini-starter
  mini-statusline
  mini-surround
  # My PR is still in nixpkgs/master.
  extras.pkgs-master.vimPlugins.mini-snippets

  # Noice.nvim and dependencies
  noice-nvim
  nui-nvim
  nvim-notify

  # telescope.nvim and extensions
  telescope-nvim
  telescope-ui-select-nvim
  telescope-fzf-native-nvim

  # treesitter
  nvim-treesitter
  nvim-treesitter-context
  # NOTE: Parsers are handled by ./treesiter.nix.
] ++ (builtins.map (name: { inherit name; path = mini-nvim; }) [
  # mini.nvim. The following are sourced from mini-nvim as currently, they are unavailable in nixpkgs
])

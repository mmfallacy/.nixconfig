vimPlugins : with vimPlugins; [
  lazy-nvim

  # Common Dependencies
  plenary-nvim

  # Plugins
  oil-nvim

  # mini.nvim
  { name = "mini.pairs"; path = mini-nvim; }

  # telescope.nvim and extensions
  telescope-nvim
  telescope-ui-select-nvim
  telescope-fzf-native-nvim

  # treesitter
  nvim-treesitter
  nvim-treesitter-context
  # NOTE: Parsers are handled by ./treesiter.nix.
]

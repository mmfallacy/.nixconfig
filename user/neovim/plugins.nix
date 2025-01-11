vimPlugins : with vimPlugins;
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
  # mini.nvim
  # Nixpkgs ships mini-nvim completely, with no way to sparsely checkout individual subplugins
  # Hence, we will create symlinks to the complete plugin path to mimic lazy.nvim's way of
  # handling these plugins
  "mini.ai"
  # "mini.base16" will already be included via stylix.
  "mini.cursorword"
  "mini.files"
  "mini.hipatterns"
  "mini.indentscope"
  "mini.splitjoin"
  "mini.starter"
  "mini.statusline"
  "mini.surround"

  # We will use this also as a blink.cmp snippet source
  "mini.snippets"

])

{ pkgs, extras } : let
# NOTE: Preference is stable -> unstable -> master.
  master = extras.pkgs-master.vimPlugins;
  unstable = extras.pkgs-unstable.vimPlugins;
# At least fallback to unstable in the case some plugins do not get backported.
# Immediately update once nixpkgs-master gets merged to unstable after a few days.
in with pkgs.vimPlugins;
[
  lazy-nvim

  # Common Dependencies
  plenary-nvim

  # Plugins
  oil-nvim
  gitsigns-nvim

  unstable.snacks-nvim

  # blink-cmp and other snippet sources
  unstable.blink-cmp
  friendly-snippets
  unstable.mini-snippets

  # Colorschemes and icons
  onedarkpro-nvim
  night-owl-nvim
  mini-base16
  nvim-web-devicons

  # Mini.nvim
  mini-ai
  mini-cursorword
  mini-files
  mini-hipatterns
  mini-pairs
  mini-splitjoin
  mini-statusline
  mini-surround

  # telescope.nvim and extensions
  telescope-nvim
  telescope-ui-select-nvim
  telescope-fzf-native-nvim

  # treesitter
  nvim-treesitter
  nvim-treesitter-context
  # NOTE: Parsers are handled by ./treesiter.nix.

  # LSP and other configuration
  nvim-lspconfig
  lazydev-nvim
  # NOTE: LSP installation is handled by ./lsp.nix.

] ++ (builtins.map (name: { inherit name; path = mini-nvim; }) [
  # mini.nvim. The following are sourced from mini-nvim as currently, they are unavailable in nixpkgs
])

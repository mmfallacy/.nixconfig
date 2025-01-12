{ pkgs, extras } :
# NOTE: Preference is stable -> unstable -> master.
# At least fallback to unstable in the case some plugins do not get backported.
# Immediately update once nixpkgs-master gets merged to unstable after a few days.
with pkgs.vimPlugins;
[
  lazy-nvim

  # Common Dependencies
  plenary-nvim

  # Plugins
  oil-nvim
  gitsigns-nvim

  # nixpkgs-stable is outdated. (<2024-11-13)
  extras.pkgs-master.vimPlugins.snacks-nvim

  # blink-cmp and other snippet sources
  blink-cmp
  friendly-snippets
  # My PR is still in nixpkgs/master.
  extras.pkgs-master.vimPlugins.mini-snippets

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
] ++ (builtins.map (name: { inherit name; path = mini-nvim; }) [
  # mini.nvim. The following are sourced from mini-nvim as currently, they are unavailable in nixpkgs
])

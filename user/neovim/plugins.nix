{ pkgs, extras }:
let
  # NOTE: Preference is stable -> unstable -> master.
  master = extras.pkgs-master.vimPlugins;
  unstable = extras.pkgs-unstable.vimPlugins;

  # Create plugin source from mypkgs and set to follow pkgs stable
  mypkgs = pkgs.lib.mapAttrsRecursive (k: v: v { follows = pkgs; }) extras.mypkgs.vimPlugins;
in
# At least fallback to unstable in the case some plugins do not get backported.
# Immediately update once nixpkgs-master gets merged to unstable after a few days.
with pkgs.vimPlugins;
[
  unstable.lazy-nvim # unstable: 2025-02-15;

  # Common Dependencies
  plenary-nvim

  # Plugins
  oil-nvim
  gitsigns-nvim
  unstable.render-markdown-nvim # unstable: 2025-02-12;
  mypkgs.live-preview-nvim
  vim-sleuth

  unstable.snacks-nvim # unstable: 2025-02-15;

  # blink-cmp and other snippet sources
  unstable.blink-cmp # unstable: 2025-01-06;
  unstable.friendly-snippets # unstable: 2024-12-02;
  unstable.mini-snippets # unstable: 2025-02-13;

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
  unstable.conform-nvim # unstable: 2025-02-13;
  # NOTE: LSP installation is handled by ./lsp.nix.

]
++ (builtins.map
  (name: {
    inherit name;
    path = mini-nvim;
  })
  [
    # mini.nvim. The following are sourced from mini-nvim as currently, they are unavailable in nixpkgs
  ]
)

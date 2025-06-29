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
# i.e. when `nixos-xx.xx` (stable branch) supports the version indicated beside unstable.<plugin>
with pkgs.vimPlugins;
[
  lazy-nvim

  # Common Dependencies
  plenary-nvim

  # Plugins
  oil-nvim
  gitsigns-nvim
  unstable.render-markdown-nvim
  mypkgs.live-preview-nvim
  vim-sleuth

  # AI
  avante-nvim
  nui-nvim

  snacks-nvim
  nvim-config-local

  # Local used plugins:
  follow-md-links-nvim

  # blink-cmp
  blink-cmp
  blink-cmp-avante

  # snippets
  friendly-snippets
  {
    # Set luasnip to what neovim expects (L3MON4D3/LuaSnip).
    name = "LuaSnip";
    path = luasnip;
  }

  # nvim-cmp
  nvim-cmp
  cmp-nvim-lsp
  cmp-buffer
  cmp-path
  cmp-emoji
  cmp_luasnip

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
  conform-nvim
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

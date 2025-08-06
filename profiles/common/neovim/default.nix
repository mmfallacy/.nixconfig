# This neovim user module is loosely based on https://github.com/LazyVim/LazyVim/discussions/1972.
{
  config,
  pkgs,
  const,
  lib,
  extras,
  ...
}:
let
  dotfiles = "${config.home.homeDirectory}/${const.dotfiles}";

  # Compute lazypath.
  # Also pass extras so we can source other inputs for vim plugins
  lazypath = import ./lazy.nix { inherit lib pkgs extras; };
  # Compute parserpath
  parserpath = import ./treesitter.nix { inherit lib pkgs extras; };
  # LSPs
  lsps = import ./lsp.nix { inherit lib pkgs extras; };
in
{
  warnings = [ " profiles/common/neovim: This submodule is now deprecated. Use .nixnvim instead!" ];

  programs.neovim = {
    enable = true;
    defaultEditor = true;

    extraPackages =
      with pkgs;
      [
        # Clipboard provider for Neovim
        xclip # X11
        wl-clipboard # Wayland

        # Required by telescope
        ripgrep
        fd
      ]
      ++ lsps;
    # Create a nix-compatible entry point.
    extraLuaConfig = ''
            vim.opt.rtp:prepend("${lazypath}/lazy.nvim")

            -- This contains the overrides for opts to make lazy.nvim work with nix
            local opts = {
              dev = {
                -- Handle plugin installation from nix, point lazy to lazy-plugins linkfarm
                path = "${lazypath}",
                -- Match all plugins for local lazy-plugins sourcing
                patterns = { "" },
                -- Do not fallback to git as the linkfarm is readonly (location inside /nix/store )
                fallback = false,
              },
              install = {
                -- Disable installation of missing plugins (probably a redundancy as opts.dev.fallback is already false)
                missing = false,
              },
              performance = {
                rtp = {
                  -- Include nvim-treesitter-grammars to runtimepath which is required to set parser_install_dir
                  paths = {
                    "${parserpath}"
                  }
                }
              }
            }

            -- This contains the overrides for spec to make lazy.nvim work with nix.
            local spec = {
              {
                'nvim-treesitter/nvim-treesitter',
                optional = true,
                opts = {
      			      ensure_installed = {},
                  parser_install_dir = "${parserpath}"
                },
              },
            }

            -- Set lazy.nvim up using custom wrapper
            require("custom.lazy").setup(spec , opts)
    '';

  };

  # Create scripts
  home.packages = with pkgs; [
    (writeShellScriptBin "nvcd" ''
      pushd "$1" && nvim . "''${@:2}" && popd
    '')

    # JIT Key Decryption
    sops
    age
  ];

  # Symlink the configuration folder, excluding init.lua
  xdg.configFile."nvim/lua".source =
    config.lib.file.mkOutOfStoreSymlink "${dotfiles}/profiles/common/neovim/config/lua";
  # Symlink lazypath to $XDG_DATA_HOME/nvim/lazy recursively to mimic a normal lazy installation
  xdg.dataFile."nvim/lazy".source = lazypath;
  xdg.dataFile."nvim/lazy".recursive = true;
  # Symlink lazypath to $XDG_DATA_HOME/nvim/lazy-plugins for debugging purposes;
  xdg.dataFile."nvim/lazy-plugins".source = lazypath;
  # Symlink parserpath to $XDG_DATA_HOME/nvim/nvim-treesitter-grammars for debugging purposes;
  xdg.dataFile."nvim/nvim-treesitter-grammars".source = parserpath;

}

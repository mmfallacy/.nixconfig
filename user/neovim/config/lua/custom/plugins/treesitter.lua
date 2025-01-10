local M = {
  'nvim-treesitter/nvim-treesitter',
  event = { "BufReadPost" , "BufNewFile" },
  opts = {}
}

M.opts.ensure_installed = {
  -- Based on LazyVim's default ensure_installed.
  "bash",
  "c",
  "diff",
  "html",
  "javascript",
  "jsdoc",
  "json",
  "jsonc",
  "lua",
  "luadoc",
  "luap",
  "markdown",
  "markdown_inline",
  "printf",
  "python",
  "query",
  "regex",
  "toml",
  "tsx",
  "typescript",
  "vim",
  "vimdoc",
  "xml",
  "yaml",
  -- Self
  "nix",
}

return {}

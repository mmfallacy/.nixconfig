local M = {
  'nvim-treesitter/nvim-treesitter',
  event = { "BufReadPost" , "BufNewFile" },
  opts = {}
}

local ensure_installed = {
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

function M.config(_,opts)
  require("nvim-treesitter.configs").setup(opts)

  local parsers = require("nvim-treesitter.info").installed_parsers()
  vim.print(parsers)

end


return M


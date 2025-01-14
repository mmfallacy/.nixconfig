local M = {
  'neovim/nvim-lspconfig',
}

M.event = { "BufReadPre", "BufNewFile" }

M.config = require("custom.plugins.lsp.setup")

return M


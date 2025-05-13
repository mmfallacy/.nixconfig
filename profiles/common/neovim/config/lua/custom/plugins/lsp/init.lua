local M = {
  'neovim/nvim-lspconfig',
}

M.event = { 'BufReadPre', 'BufNewFile' }
M.dependencies = { 'saghen/blink.cmp' }

M.config = require('custom.plugins.lsp.setup')

return M

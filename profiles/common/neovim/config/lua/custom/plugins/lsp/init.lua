local M = {
  'neovim/nvim-lspconfig',
}

M.event = { 'BufReadPre', 'BufNewFile' }
M.dependencies = {
  { 'saghen/blink.cmp', optional = true },
  { 'hrsh7th/nvim-cmp', optional = true },
}

M.config = require('custom.plugins.lsp.setup')

return M

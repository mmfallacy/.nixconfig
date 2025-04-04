return function(_, bufnr)
  local bufmap = function(combo, macro)
    vim.keymap.set('n', combo, macro, { buffer = bufnr, noremap = true, silent = true })
  end

  bufmap('K', vim.lsp.buf.hover)
  bufmap('<C-k>', vim.lsp.buf.signature_help)
  bufmap('<leader>ca', vim.lsp.buf.code_action)
  bufmap('<leader>rr', vim.lsp.buf.rename)

  bufmap('<leader>dl', function()
    vim.diagnostic.open_float({ scope = 'line' })
  end)

  local builtins = require('telescope.builtin')

  bufmap('<leader>dw', builtins.diagnostics)
  bufmap('<leader>dd', function()
    builtins.diagnostics({ bufnr = 0 })
  end)
end

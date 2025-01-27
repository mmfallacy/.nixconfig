return function(_, _)
  local lsp = require('lspconfig')

  lsp.lua_ls.setup({})
  lsp.marksman.setup({})
  lsp.nil_ls.setup({})
  lsp.zls.setup({})
end

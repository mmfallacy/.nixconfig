return function(_, _)
  local lsp = require("lspconfig")

  lsp.lua_ls.setup {}
  lsp.nil_ls.setup {}
end

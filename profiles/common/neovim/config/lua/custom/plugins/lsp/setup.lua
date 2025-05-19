local function lsp_setup_handlers(handlers, global)
  local lsp = require('lspconfig')
  local not_installed = {}

  for server, _opts in pairs(handlers) do
    local opts = vim.tbl_deep_extend('force', global, _opts)
    lsp[server].setup(opts)
    if vim.fn.executable(lsp[server].cmd[1]) ~= 1 then
      vim.list_extend(not_installed, { server })
    end
  end

  if #not_installed > 0 then
    vim.notify_once(
      'Some configured language servers are not accessible!\nCheck if lsp executables are installed.\nMissing LSPS:'
        .. vim.inspect(not_installed),
      vim.log.levels.WARN
    )
  end
end

return function(_, _)
  local lsp = require('lspconfig')

  local on_attach = require('custom.plugins.lsp.keybinds')

  local global = {
    on_attach = on_attach,
    -- Setup nvim-lspconfig capabilities
    -- See https://github.com/neovim/nvim-lspconfig/issues/3494; https://cmp.saghen.dev/installation.html
    capabilities = require('blink.cmp').get_lsp_capabilities(),
  }

  local handlers = {
    ['lua_ls'] = {},
    ['marksman'] = {},
    ['nil_ls'] = {},
    ['zls'] = {},
    ['rust_analyzer'] = {},
    ['vtsls'] = {},
    ['emmet_language_server'] = {
      init_options = {
        syntaxProfiles = {
          html = {
            ['self_closing_tags'] = 'xhtml',
          },
        },
      },
    },
    ['cssls'] = {},
    ['eslint'] = {},
  }

  lsp_setup_handlers(handlers, global)
end

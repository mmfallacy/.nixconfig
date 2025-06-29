-- Sets up lsp servers based on handlers table
local function lsp_setup_handlers(handlers, global)
  local lsp = require('lspconfig')
  local not_installed = {}

  for server, _opts in pairs(handlers) do
    -- Extend handler-specific opts with global
    local opts = vim.tbl_deep_extend('force', global, _opts)
    lsp[server].setup(opts)
    -- Track servers that are not installed!
    -- TODO: Instead output servers installed as most LSPs are installed through nix-shells
    if vim.fn.executable(lsp[server].cmd[1]) ~= 1 then
      vim.list_extend(not_installed, { server })
    end
  end

  -- Warn when there are LSP servers that are not yet installed
  if #not_installed > 0 then
    vim.notify_once(
      'Some configured language servers are not accessible!\nCheck if lsp executables are installed.\nMissing LSPS:'
        .. vim.inspect(not_installed),
      vim.log.levels.WARN
    )
  end
end

-- This function returns a table of client capabilities. The capabilities depend on which completion engine is used.
local function get_capabilities()
  local has_cmp, cmp = pcall(require, 'cmp')
  local has_blink, blink = pcall(require, 'blink.cmp')

  if has_cmp then
    return require('cmp_nvim_lsp').default_capabilities()
  elseif has_blink then
    -- See https://github.com/neovim/nvim-lspconfig/issues/3494; https://cmp.saghen.dev/installation.html
    return blink.get_lsp_capabilities()
  else
    vim.notify(
      [[ No registered completion engine found! Defaulting to vim LSP Client Capabilities. ]],
      vim.log.levels.WARN
    )
    return vim.lsp.protocol.make_client_capabilities()
  end
end

return function(_, _)
  local lsp = require('lspconfig')

  local on_attach = require('custom.plugins.lsp.keybinds')

  local global = {
    on_attach = on_attach,
    capabilities = get_capabilities(),
  }

  local handlers = {
    ['lua_ls'] = {},
    ['marksman'] = {},
    ['nil_ls'] = {
      nix = { flake = { autoArchive = true } },
    },
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
    ['bashls'] = {},
  }

  lsp_setup_handlers(handlers, global)
end

-- https://cmp.saghen.dev/recipes.html#deprioritize-specific-lsp
local function emmetsort(a, b)
  if a.client_name == nil or b.client_name == nil then
    return
  end
  if a.client_name == b.client_name then
    return
  end
  return b.client_name == 'emmet_language_server'
end

local M = {
  'saghen/blink.cmp',
  dependencies = {
    'rafamadriz/friendly-snippets',
    'echasnovski/mini.snippets',
    'Kaiser-Yang/blink-cmp-avante',
  },
  -- Enable completion only on text input.
  event = 'InsertEnter',
}

M.opts = {}
M.opts.fuzzy = {
  sorts = {
    -- Prioritize non emmet sources!
    emmetsort,
    'score',
    'sort_text',
  },
}

M.opts.sources = {
  default = {
    'avante',
    'lsp',
    'path',
    'buffer',
  },
}

M.opts.sources.providers = {
  avante = {
    module = 'blink-cmp-avante',
    name = 'Avante',
    opts = {},
  },
}

return M

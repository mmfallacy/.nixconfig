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
    -- TODO: Reintroduce snippets via luasnip!
    'Kaiser-Yang/blink-cmp-avante',
    'moyiz/blink-emoji.nvim',
  },
}

local N = {}

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
    'emoji',
  },
}

M.opts.sources.providers = {
  avante = {
    module = 'blink-cmp-avante',
    name = 'Avante',
    opts = {},
  },
  emoji = {
    module = 'blink-emoji',
    name = 'Emoji',
  },
}

return M

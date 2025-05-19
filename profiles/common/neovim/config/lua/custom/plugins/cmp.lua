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

return {
  'saghen/blink.cmp',
  dependencies = {
    'rafamadriz/friendly-snippets',
    'echasnovski/mini.snippets',
  },
  opts = {
    fuzzy = {
      sorts = {
        -- Prioritize non emmet sources!
        emmetsort,
        'score',
        'sort_text',
      },
    },
  },
  -- Enable completion only on text input.
  event = 'InsertEnter',
}

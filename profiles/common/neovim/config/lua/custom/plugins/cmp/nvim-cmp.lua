local M = {
  'hrsh7th/nvim-cmp',
  dependencies = {
    --
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    --
    'hrsh7th/cmp-emoji',
  },
  -- Enable completion only on text input.
  event = 'InsertEnter',
}
function M.config(_, _opts)
  local cmp = require('cmp')

  local opts = _opts or {}
  opts.view = { entries = 'native' }
  -- opts.completion = { completeopt = 'menu,menuone,noselect,noinsert,preview' }
  opts.snippets = {
    expand = function(args)
      vim.snippet.expand(args.body)
    end,
  }

  opts.sources = cmp.config.sources({
    { name = 'nvim_lsp', max_item_count = 15 },
    { name = 'buffer', max_item_count = 10, keyword_length = 5 },
    { name = 'path', max_item_count = 5 },
    { name = 'emoji', max_item_count = 10 },
  })

  opts.mapping = {
    ['<C-Space>'] = cmp.mapping.open_docs(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-y>'] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace,
    }),

    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),

    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),

    ['<C-k>'] = cmp.mapping.open_docs(),

    -- Snippets

    ['<Tab>'] = function(fallback)
      if not cmp.select_next_item() then
        if vim.bo.buftype ~= 'prompt' and has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end
    end,

    ['<S-Tab>'] = function(fallback)
      if not cmp.select_prev_item() then
        if vim.bo.buftype ~= 'prompt' and has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end
    end,
  }

  cmp.setup(opts)
end

return M

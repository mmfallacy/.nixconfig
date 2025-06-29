local M = {
  'hrsh7th/nvim-cmp',
  dependencies = {
    --
    'hrsh7th/cmp-buffer',
    'hrsh7th/cmp-nvim-lsp',
    'hrsh7th/cmp-path',
    --
    'hrsh7th/cmp-emoji',

    -- Snippets
    'rafamadriz/friendly-snippets',
    'saadparwaiz1/cmp_luasnip',
    'L3MON4D3/LuaSnip',
  },
}

function M.config(_, _opts)
  local cmp = require('cmp')
  local snip = require('luasnip')

  -- Load friendly-snippets via LuaSnip
  require('luasnip.loaders.from_vscode').lazy_load()

  local opts = _opts or {}
  -- menu,menuone default nvim-cmp
  -- select enables first item selection
  -- noinsert disables autocompletion
  opts.completion = { completeopt = 'menu,menuone,select,noinsert' }
  opts.view = {
    docs = {
      auto_open = false,
    },
  }

  opts.snippet = {
    expand = function(args)
      snip.lsp_expand(args.body)
    end,
  }

  opts.sources = cmp.config.sources({
    { name = 'nvim_lsp', max_item_count = 15 },
    { name = 'luasnip', max_item_count = 5 },
    { name = 'buffer', max_item_count = 10, keyword_length = 5 },
    { name = 'path', max_item_count = 5 },
    { name = 'emoji', max_item_count = 10 },
  })

  opts.mapping = {
    ['<C-Space>'] = cmp.mapping.open_docs(),
    ['<C-e>'] = cmp.mapping.abort(),

    ['<C-p>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    ['<C-n>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),

    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),

    ['<C-k>'] = cmp.mapping.open_docs(),

    -- Snippets
    ['<C-y>'] = cmp.mapping(function(fallback)
      if not cmp.visible() then
        fallback()
      elseif snip.expandable() then
        snip.expand()
      else
        cmp.confirm({
          select = true,
          behavior = cmp.ConfirmBehavior.Replace,
        })
      end
    end),

    ['<Tab>'] = cmp.mapping(function(fallback)
      if snip.expand_or_locally_jumpable() then
        snip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),

    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if snip.locally_jumpable(-1) then
        snip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  }

  cmp.setup(opts)
end

return M

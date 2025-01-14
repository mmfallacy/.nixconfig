local utils = require('custom.utils')

local FileMinis = utils.map_event('BufReadPost', 'BufNewFile')({
  { 'echasnovski/mini.ai', opts = {} },
  { 'echasnovski/mini.cursorword', opts = {} },
  { 'echasnovski/mini.hipatterns', opts = {} },
  { 'echasnovski/mini.surround', opts = {} },
})

local VeryLazyMinis = utils.map_event('VeryLazy')({
  { 'echasnovski/mini.statusline', opts = {} },
})

return {
  {
    'echasnovski/mini.pairs',
    opts = {},
    event = { 'InsertEnter' },
  },
  {
    'echasnovski/mini.files',
    opts = {
      options = {
        use_as_default_explorer = false,
      },
    },
    lazy = false,
  },
  {
    'echasnovski/mini.splitjoin',
    opts = {},
    keys = { 'gS' },
  },
  {
    'echasnovski/mini.base16',
    config = nil,
    lazy = false,
  },
  FileMinis,
  VeryLazyMinis,
}

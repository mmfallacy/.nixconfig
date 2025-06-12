local M = {
  'yetone/avante.nvim',
  event = 'VeryLazy',
  version = false,
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    'nvim-lua/plenary.nvim',
    'MunifTanjim/nui.nvim',

    -- File selector picker
    'nvim-telescope/telescope.nvim',
    -- Rendering Avante Files
    'MeanderingProgrammer/render-markdown.nvim',
    -- TODO: Image pasting dependency
  },
}

M.opts = {
  provider = 'claude',
}

return M

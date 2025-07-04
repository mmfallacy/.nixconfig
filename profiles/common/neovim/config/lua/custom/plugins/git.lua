local M = {
  'lewis6991/gitsigns.nvim',
  opts = {},
  event = 'VeryLazy',
}

local N = {
  'NeogitOrg/neogit',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'sindrets/diffview.nvim',
  },
  cmd = { 'Neogit', 'Git' },
  opts = function()
    -- Create :Git alias for :Neogit
    vim.api.nvim_create_user_command('Git', 'Neogit', {})
    return {}
  end,
}

return {
  M,
  N,
}

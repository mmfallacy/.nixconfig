return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {},
    event = 'VeryLazy',
  },
  {
    'nvim-tree/nvim-web-devicons',
    opts = {},
    event = 'VeryLazy',
  },
  {
    'folke/snacks.nvim',
    -- According to its README, a couple plugins might require snacks.nvim to be setup early.
    lazy = false,
    opts = {
      indent = {},
      notifier = {
        enabled = true,
      },
      styles = {
        notification = {
          wo = {
            wrap = true,
          },
        },
      },
    },
    init = function()
      vim.api.nvim_create_user_command('NotifierHistory', function()
        Snacks.notifier.show_history()
      end, {})
    end,
  },
}

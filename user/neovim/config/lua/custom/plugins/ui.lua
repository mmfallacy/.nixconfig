return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {},
    event = "VeryLazy"
  },
  {
    'folke/snacks.nvim',
    -- According to its README, a couple plugins might require snacks.nvim to be setup early.
    lazy = false,
    opts = {
      indent = {

      },
      notifier  = {
        enabled = true,
        timeout = 1500,
      },
      styles = {
        notification = {
          wo = {
            wrap = true,
          }
        }
      }
    }
  }
}

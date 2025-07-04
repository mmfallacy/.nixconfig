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
  cmd = { 'Neogit', 'G' },
  opts = function()
    -- Create :Git alias for :Neogit
    vim.api.nvim_create_user_command('G', 'Neogit', {})
    return {
      commit_editor = {
        kind = 'split_below',
        staged_diff_split_kind = 'vsplit',
      },
      -- NOTE: Neogit currently doesn't support SSH signing.
      -- All commits are signed via the git config option `commit.gpgSign = true`
      -- Do note that signing can still work without gpg being present if `gpg.format = "ssh"`
      -- commit_view = {verify_commit = nil,},
    }
  end,
}

return {
  M,
  N,
}

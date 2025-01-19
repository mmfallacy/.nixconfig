local M = {
  'stevearc/oil.nvim',
  lazy = false,
  opts = {
    view_options = {
      show_hidden = true,
    },
  },
}

function M.config(_, opts)
  require('oil').setup(opts)

  vim.api.nvim_create_user_command('Explore', 'Oil', {})
  vim.api.nvim_create_user_command('Vexplore', function()
    vim.cmd.vsplit({ mods = { split = 'botright' } })
    vim.cmd('Oil')
  end, {})

  vim.api.nvim_create_user_command('Hexplore', function()
    vim.cmd.split({ mods = { split = 'botright' } })
    vim.cmd('Oil')
  end, {})
end

return M

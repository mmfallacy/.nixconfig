-- Rename :EditQuery user command as it conflicts with :Explore when quickly using :E
vim.api.nvim_del_user_command('EditQuery')

-- Run on VeryLazy User Event
vim.api.nvim_create_autocmd('User', {
  pattern = 'VeryLazy',
  callback = function()
    -- Override colors for Line Number Column
    vim.api.nvim_set_hl(0, 'LineNrAbove', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { bg = 'NONE' })
  end,
})

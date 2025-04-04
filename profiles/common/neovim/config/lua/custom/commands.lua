-- Rename :EditQuery user command as it conflicts with :Explore when quickly using :E
vim.api.nvim_del_user_command('EditQuery')

-- Run on VeryLazy User Event
vim.api.nvim_create_autocmd('User', {
  pattern = 'VeryLazy',
  callback = function()
    -- Override colors for Line Number Column
    vim.api.nvim_set_hl(0, 'LineNrAbove', { bg = 'NONE' })
    vim.api.nvim_set_hl(0, 'LineNrBelow', { bg = 'NONE' })
    -- Create and hightlight color column for max line width
    vim.o.textwidth = 0
    vim.o.colorcolumn = '120' -- Relative to textwidth

    local palette = require('mini.base16').config.palette
    vim.api.nvim_set_hl(0, 'ColorColumn', { bg = palette.base02 })
  end,
})

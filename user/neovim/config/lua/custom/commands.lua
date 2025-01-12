-- Rename :EditQuery user command as it conflicts with :Explore when quickly using :E
vim.api.nvim_del_user_command('EditQuery')

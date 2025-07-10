local noremap = { noremap = true }

local silent_noremap = { noremap = true, silent = true }

local map = vim.keymap.set

-- Unbind Ctrl+C to unlearn Ctrl+C=Esc keymap from before I already have hardware-level remapped my Capslock to Esc
map({ 'n', 'v', 'c', 'i' }, '<C-c>', '<nop>')

-- Delete buffer but keep split
map({ 'n', 'v', 'c', 'i' }, '<leader>bd', ':bp | bd # <CR>')

-- Toggle between current and last buffer
map({ 'n', 'v', 'c', 'i' }, '<leader>bp', ':b# <CR>')

-- FIX: This might produce an error as Re is a user command which depends on a lazy-loaded Oil.nvim.
-- Delete all buffers and open Oil on root
map({ 'n', 'v', 'c', 'i' }, '<leader>bda', ':%bd | Re<CR>')

-- Delete all buffers except current
-- delete all | open last |  delete [No Name]
map({ 'n', 'v', 'c', 'i' }, '<leader>bde', ':%bd | e# | bd# <CR>')

-- Ctrl+D/U/B/F then recenter
map('n', '<C-d>', '<C-d>zz')
map('n', '<C-u>', '<C-u>zz')
map('n', '<C-b>', '<C-b>zz')
map('n', '<C-f>', '<C-f>zz')

-- Ctrl+Arrow for resizing splits
map('n', '<C-Up>', ':resize +2<CR>', silent_noremap)
map('n', '<C-Down>', ':resize -2<CR>', silent_noremap)
map('n', '<C-Left>', ':vertical resize -2<CR>', silent_noremap)
map('n', '<C-Right>', ':vertical resize +2<CR>', silent_noremap)

local noremap = { noremap = true }

local silent_noremap = { noremap = true, silent = true }

local map = vim.keymap.set

-- Unbind Ctrl+C to unlearn Ctrl+C=Esc keymap from before
-- I already have hardware-level remapped my Capslock to Esc
map({ 'n', 'v', 'c', 'i' }, '<C-c>', '<nop>')

-- Delete buffer but keep split
map({ 'n', 'v', 'c', 'i' }, '<leader>bd', ':bp | bd # <CR>')

-- Toggle between current and last buffer
map({ 'n', 'v', 'c', 'i' }, '<leader>bp', ':b# <CR>')

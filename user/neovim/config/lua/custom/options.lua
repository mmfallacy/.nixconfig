vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- -------------------------------------------------------------

-- Enable undofiles
vim.o.undofile = true

-- Disable highlight on search
vim.o.hlsearch = false

-- Show substitution offscreen results in a preview window
vim.o.inccommand = 'split'

-- Sync clipboard between OS and Neovim
vim.o.clipboard = 'unnamedplus'

-- Set statusline global and linked only to the last window (3)
vim.o.laststatus = 3

-- -----------------------------------------------------------

-- Text wrapping
vim.o.breakindent = true
vim.o.linebreak = true
vim.o.wrap = true

-- Interface appearance
vim.o.ruler = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.scrolloff = 5
vim.o.showmode = false
vim.o.cursorline = true
vim.o.termguicolors = true

-- Indentation
-- Take these options with a grain of salt
-- Most will be overriden by vim-sleuth
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true

-- Prioritize right split.
vim.o.splitbelow = false
vim.o.splitright = true

-- Optimizations
vim.o.history = 1024
vim.o.backup = false
vim.o.writebackup = false
vim.o.updatetime = 250

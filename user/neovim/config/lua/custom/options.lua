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

-- Decrease map sequence timeout
vim.o.timeoutlen = 300

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
vim.o.signcolumn = 'number'
vim.o.cursorline = true
vim.o.termguicolors = true

-- Indentation
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4

-- Prioritize right split.
vim.o.splitbelow = false
vim.o.splitright = true

-- Optimizations
vim.o.history = 1024
vim.o.backup = false
vim.o.writebackup = false
vim.o.lazyredraw = true
vim.o.updatetime = 250


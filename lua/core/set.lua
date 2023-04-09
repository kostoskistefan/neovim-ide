-- Disable Neovim's built-in file explorer
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Hide vim command line when it's not used
vim.opt.cmdheight = 0

-- Enable 256 colors
vim.opt.termguicolors = true

-- Syntax Highlighting
vim.opt.syntax = 'on'

-- Show line numbers
vim.opt.number = true

-- Set hybrid line numbers
vim.o.relativenumber = true

-- Use UTF-8 encoding (for vim devicons)
vim.opt.encoding = 'UTF-8'

-- Set tab to 4 spaces
vim.opt.tabstop     = 4
vim.opt.shiftwidth  = 4
vim.opt.softtabstop = 4

-- Convert tabs to spaces
vim.opt.expandtab = true

-- Set working directory to the current file
vim.opt.autochdir = true

-- Use an undo file to preserve history between sessions
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand('~/.config/nvim/.undo-dir')

-- Hide Vim modes, since we are using lightline
vim.opt.showmode = false 

-- Use system clipboard
vim.opt.clipboard = 'unnamedplus'

-- Set folding by syntax
vim.opt.foldmethod = 'syntax'
vim.opt.foldlevelstart = 99

-- Hide tilde character on blank lines
vim.api.nvim_create_autocmd('BufWinEnter', {
    callback = function()
        vim.wo.fillchars='eob: '
    end
})

-- Set Vim colorscheme
require('ayu')
vim.cmd('colorscheme ayu-dark')

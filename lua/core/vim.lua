-- Enable 256 colors
vim.opt.termguicolors = true

-- Syntax Highlighting
vim.opt.syntax = 'on'

-- Show line numbers
vim.opt.number = true

-- Set hybrid line numbers
vim.o.relativenumber = true

-- Use UTF-8 encoding (useful for vim devicons)
vim.opt.encoding = 'UTF-8'

-- Set tab to 4 spaces
vim.opt.tabstop     = 4
vim.opt.shiftwidth  = 4
vim.opt.softtabstop = 4

-- Use spaces instead of tabs
vim.opt.expandtab = true

-- Set working directory to the current file
vim.opt.autochdir = true

-- Use an undo file to preserve history between sessions
vim.opt.undofile = true
-- vim.opt.undodir = vim.fn.expand('~/.config/nvim/.undo-dir')

-- Use system clipboard
vim.opt.clipboard = 'unnamedplus'

-- Add a color column on line 120
vim.opt.colorcolumn = '120'

-- Hide tilde character on blank lines
vim.api.nvim_create_autocmd('BufWinEnter', {
    callback = function()
        vim.wo.fillchars='eob: '
    end
})

-- Disable netrw because the NvimTree plugin is present
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

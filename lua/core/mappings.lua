-- Function to close the current buffer if there are 
-- more than 1 buffers in the list, otherwise we exit vim
function _G.buffer_handler()
    local numberOfOpenBuffers = vim.fn.len(vim.fn.getbufinfo({ buflisted = 1 })) 
    vim.cmd(numberOfOpenBuffers == 1 and 'exit' or 'BufferClose')
end

-- Set leader key
vim.g.mapleader = ' '

-- Abbreviations for my sloppy typing
vim.cmd('cnoreabbrev W w')
vim.cmd('cnoreabbrev Q q')
vim.cmd('cnoreabbrev WQ wq')
vim.cmd('cnoreabbrev wQ wq')
vim.cmd('cnoreabbrev Wq wq')

-- Key mappings
vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files)
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep)

vim.keymap.set('n', '<leader>e', '<cmd>NeoTreeFocusToggle<cr>');

vim.keymap.set('n', '<A-h>', function() require('nvterm.terminal').toggle 'horizontal' end)
vim.keymap.set('t', '<A-h>', function() require('nvterm.terminal').toggle 'horizontal' end)

vim.keymap.set('n', '<C-_>', '<cmd>lua require("Comment.api").toggle.linewise.current()<cr>')
vim.keymap.set('v', '<C-_>', '<Esc><cmd>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<cr>')
vim.keymap.set('n', '<C-s>', '<cmd>w<cr>')
vim.keymap.set('i', '<C-s>', '<Esc>:w<cr>a')
vim.keymap.set('i', '<C-z>', '<Esc>ua')
vim.keymap.set('n', '<C-w>', '<cmd>call v:lua.buffer_handler()<cr>')
vim.keymap.set('n', '<leader>fm', '<cmd>lua vim.lsp.buf.format()<cr>')

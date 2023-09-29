-- Abbreviations for my sloppy typing
vim.cmd('cnoreabbrev W w')
vim.cmd('cnoreabbrev Q q')
vim.cmd('cnoreabbrev WQ wq')
vim.cmd('cnoreabbrev wQ wq')
vim.cmd('cnoreabbrev Wq wq')

-- Key mappings
vim.keymap.set('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>')
vim.keymap.set('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>')
vim.keymap.set('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>')
vim.keymap.set('n', '<leader>d', '<cmd>lua vim.lsp.buf.hover()<cr>')
vim.keymap.set('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<cr>')
vim.keymap.set('n', '<leader>fm', '<cmd>lua vim.lsp.buf.format()<cr>')
vim.keymap.set('n', '<leader>f', '<cmd>lua vim.diagnostic.open_float({ border = "rounded" })<cr>')

vim.keymap.set('n', '<Esc>', '<cmd>noh<cr>')
vim.keymap.set('n', '<C-s>', '<cmd>w<cr>')
vim.keymap.set('i', '<C-s>', '<Esc>:w<cr>a')

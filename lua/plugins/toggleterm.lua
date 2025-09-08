return {
    'akinsho/toggleterm.nvim',
    config = function()
        require("toggleterm").setup({
            shell = 'powershell',
        })
        vim.api.nvim_set_keymap('n', '<F12>', '<cmd>ToggleTerm<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('t', '<F12>', [[<C-\><C-n><cmd>ToggleTerm<CR>]], { noremap = true, silent = true })
    end
}

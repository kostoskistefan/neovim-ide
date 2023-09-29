return {
    'echasnovski/mini.indentscope',
    version = '*',
    init = function()
        vim.api.nvim_create_autocmd('FileType', {
            pattern = {
                'help',
                'lazy',
                'NvimTree',
            },
            callback = function()
                vim.b.miniindentscope_disable = true
            end,
        })
    end,
    config = function()
        require('mini.indentscope').setup({
            symbol = '│',
            options = {
                try_as_border = true
            },
        })
    end,
}

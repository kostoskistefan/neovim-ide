return {
    'stevearc/conform.nvim',

    lazy = true,

    keys = { { '<leader>fm', function() require('conform').format() end } },

    config = function()
        require('conform').setup({
            formatters_by_ft = {
                c = { 'clang_format' },
                cpp = { 'clang_format' },
            },
        })
    end,
}

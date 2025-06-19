return {
    'nvim-treesitter/nvim-treesitter',

    lazy = false,
    build = ':TSUpdate',

    opts = {
        configs = {
            ensure_installed = {
                'c',
                'cpp',
                'lua',
                'regex',
                'doxygen',
            },
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        },
    },

    config = function()
        require('nvim-treesitter').setup(opts)

        vim.opt.foldmethod = 'expr'
        vim.opt.foldenable = false
        vim.opt.foldlevelstart = 99
        vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
    end
}

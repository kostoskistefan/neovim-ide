return {
    'nvim-treesitter/nvim-treesitter',
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    config = function()
        require('nvim-treesitter.configs').setup({
            ensure_installed = {
                'c',
                'cpp',
                'lua',
                'vim',
                'llvm',
                'make',
                'cmake',
                'regex',
                'vimdoc',
                'doxygen',
                'markdown',
                'markdown_inline',
            },
            sync_install = false,
            highlight = {
                enable = true
            },
            indent = {
                enable = true
            },
        })

        vim.opt.foldmethod = 'expr'
        vim.opt.foldenable = false
        vim.opt.foldlevelstart = 99
        vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
    end
}

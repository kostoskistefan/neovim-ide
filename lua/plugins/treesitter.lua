vim.api.nvim_create_autocmd({'BufEnter','BufAdd','BufNew','BufNewFile','BufWinEnter'}, {
    group = vim.api.nvim_create_augroup('TS_FOLD_WORKAROUND', {}),
    callback = function()
        vim.opt.foldmethod = 'expr'
        vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
    end
})

require('nvim-treesitter.configs').setup {
    ensure_installed = { "c", "lua", "vim", "vimdoc", "query" },
    sync_install = false,
    auto_install = true,
    ignore_install = { "javascript" },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
}

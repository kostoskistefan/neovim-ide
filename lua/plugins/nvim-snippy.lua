return {
    'dcampos/nvim-snippy',

    dependencies = {
        'honza/vim-snippets'
    },

    opts = {
        mappings = {
            is = {
                ['<Tab>'] = 'expand_or_advance',
                ['<S-Tab>'] = 'previous',
            },
            nx = {
                ['<leader>x'] = 'cut_text',
            },
        },
    },
}

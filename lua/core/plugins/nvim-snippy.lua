return {
    'dcampos/nvim-snippy',
    dependencies = {
        'honza/vim-snippets'
    },
    config = function()
        require('snippy').setup({
            mappings = {
                is = {
                    ['<Tab>'] = 'expand_or_advance',
                    ['<S-Tab>'] = 'previous',
                },
                nx = {
                    ['<leader>x'] = 'cut_text',
                },
            },
        })
    end
}

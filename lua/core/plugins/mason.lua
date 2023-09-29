return {
    'williamboman/mason.nvim',
    dependencies = {
        'neovim/nvim-lspconfig',
        'williamboman/mason-lspconfig.nvim',
    },
    build = ":MasonUpdate",
    config = function()
        require('mason').setup()

        require('mason-lspconfig').setup({
            automatic_installation = {
                exclude = {
                    'cmake',
                    'clangd',
                    'lua_ls',
                }
            },
            ensure_installed = {
                'cmake',
                'clangd',
                'lua_ls',
            }
        })

        require('mason-lspconfig').setup_handlers({
            function(server_name)
                require('lspconfig')[server_name].setup({})
            end,
        })

        -- Language servers need to be configured after Mason
        require('lspconfig').lua_ls.setup({
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' }
                    }
                }
            }
        })
    end
}

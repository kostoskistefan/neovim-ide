return {
    'hrsh7th/nvim-cmp',

    dependencies = {
        'neovim/nvim-lspconfig',

        -- Completion sources
        'hrsh7th/cmp-buffer',
        'dcampos/cmp-snippy',
        'hrsh7th/cmp-cmdline',
        'ray-x/cmp-treesitter',
        'hrsh7th/cmp-nvim-lsp',
        'FelipeLema/cmp-async-path',
        'hrsh7th/cmp-nvim-lsp-signature-help',

        -- Snippets
        'dcampos/nvim-snippy',
    },

    config = function()
        local has_words_before = function()
            unpack = unpack or table.unpack
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
        end

        local cmp = require('cmp')

        cmp.setup({
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered(),
            },

            snippet = { expand = function(args) require('snippy').expand_snippet(args.body) end },

            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'snippy' },
                { name = 'buffer' },
                { name = 'treesitter' },
                { name = 'async_path' },
                { name = 'nvim_lsp_signature_help' },
            }),

            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({ select = true }),
                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
            }),

            formatting = {
                fields = { 'kind', 'abbr', 'menu' },

                format = function(entry, vim_item)
                    local kind = require('lspkind').cmp_format({ mode = 'symbol' })(entry, vim.deepcopy(vim_item))

                    local highlights_info = require('colorful-menu').cmp_highlights(entry)

                    if highlights_info ~= nil then
                        vim_item.abbr_hl_group = highlights_info.highlights
                        vim_item.abbr = highlights_info.text
                    end

                    local strings = vim.split(kind.kind, '%s', { trimempty = true })

                    vim_item.kind = ' ' .. (strings[1] or '') .. ' '
                    vim_item.menu = ''

                    return vim_item
                end,
            },
        })

        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = { { name = 'buffer' } }
        })

        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({ { name = 'path' }, { name = 'cmdline' } }),
            matching = { disallow_symbol_nonprefix_matching = false }
        })

        local lspconfig = require('lspconfig')
        local capabilities = require('cmp_nvim_lsp').default_capabilities()

        lspconfig['clangd'].setup({ capabilities = capabilities })

        lspconfig['lua_ls'].setup({
            capabilities = capabilities,
            on_init = function(client)
                if client.workspace_folders then
                    local path = client.workspace_folders[1].name

                    if path ~= vim.fn.stdpath('config') then
                        if (vim.uv.fs_stat(path .. '/.luarc.json') or vim.uv.fs_stat(path .. '/.luarc.jsonc'))
                        then
                            return
                        end
                    end
                end

                client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
                    runtime = {
                        version = 'LuaJIT',
                        path = {
                            'lua/?.lua',
                            'lua/?/init.lua',
                        },
                    },
                    workspace = {
                        checkThirdParty = false,
                        library = {
                            vim.env.VIMRUNTIME,
                            '${3rd}/luv/library',
                        }
                    }
                })
            end,
            settings = { Lua = {} }
        })
    end
}

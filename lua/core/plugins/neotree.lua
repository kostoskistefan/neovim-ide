return {
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v3.x',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-tree/nvim-web-devicons',
        'MunifTanjim/nui.nvim',
    },
    keys = {
        {
            '<leader>e',
            '<cmd>Neotree toggle<cr>'
        },
        {
            '<F2>',
            'r',
            remap = true
        },
    },
    deactivate = function()
        vim.cmd([[Neotree close]])
    end,
    init = function()
        if vim.fn.argc() == 1 then
            local stat = vim.loop.fs_stat(vim.fn.argv(0))
            if stat and stat.type == 'directory' then
                require('neo-tree')
            end
        end
    end,
    config = function()
        vim.fn.sign_define(
            'DiagnosticSignError',
            {
                text = ' ',
                texthl = 'DiagnosticSignError'
            }
        )

        vim.fn.sign_define(
            'DiagnosticSignWarn',
            {
                text = ' ',
                texthl = 'DiagnosticSignWarn'
            }
        )

        vim.fn.sign_define(
            'DiagnosticSignInfo',
            {
                text = ' ',
                texthl = 'DiagnosticSignInfo'
            }
        )

        vim.fn.sign_define(
            'DiagnosticSignHint',
            {
                text = '',
                texthl = 'DiagnosticSignHint'
            }
        )

        require('neo-tree').setup({
            filesystem = {
                bind_to_cwd = false,
                follow_current_file = { enabled = true },
                use_libuv_file_watcher = true,
            },
            close_if_last_window = true,
            enable_git_status = true,
            enable_diagnostics = true,
            default_component_configs = {
                container = {
                    enable_character_fade = true
                },
                indent = {
                    indent_size = 4,
                    padding = 1,
                    with_markers = true,
                    indent_marker = '│',
                    last_indent_marker = '└',
                    highlight = 'NeoTreeIndentMarker',
                    with_expanders = true,
                    expander_collapsed = "",
                    expander_expanded = "",
                    expander_highlight = "NeoTreeExpander",
                },
                icon = {
                    folder_closed = '',
                    folder_open = '',
                    folder_empty = 'ﰊ',
                    -- The next two settings are only a fallback, if you use nvim-web-devicons and configure default icons there
                    -- then these will never be used.
                    default = '*',
                    highlight = 'NeoTreeFileIcon'
                },
                modified = {
                    symbol = '✚',
                    highlight = 'NeoTreeModified',
                },
                name = {
                    trailing_slash = false,
                    use_git_status_colors = true,
                    highlight = 'NeoTreeFileName',
                },
                git_status = {
                    symbols = {
                        added     = '✚',
                        modified  = '',
                        deleted   = '✖',
                        renamed   = '',
                        untracked = '',
                        ignored   = '',
                        unstaged  = '',
                        staged    = '',
                        conflict  = '',
                    }
                },
            },
            window = {
                position = 'left',
                width = 34,
                mapping_options = {
                    noremap = true,
                    nowait = true,
                },
                mappings = {
                    ["<space>"] = "none",
                },
            }
        })
    end
}

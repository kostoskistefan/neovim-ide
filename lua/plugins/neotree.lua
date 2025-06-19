return {
    "nvim-neo-tree/neo-tree.nvim",

    lazy = false,
    branch = "v3.x",

    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },

    keys = {
        { '<leader>e', ':Neotree toggle<cr>' },
        { '<F2>', 'r', remap = true },
    },

    config = function()
        local components = require('neo-tree.sources.common.components')

        require('neo-tree').setup({
            enable_git_status = true,
            enable_diagnostics = true,
            close_if_last_window = true,
            open_files_using_relative_paths = false,
            open_files_do_not_replace_types = { "terminal", "trouble", "qf" },
            window = { width = 35 },
            filesystem = {
                components = {
                    name = function(config, node, state)
                        local name = components.name(config, node, state)
                        if node:get_depth() == 1 then
                            name.text = vim.fs.basename(vim.loop.cwd() or '')
                        end
                        return name
                    end,
                },
            }
        })
    end
}

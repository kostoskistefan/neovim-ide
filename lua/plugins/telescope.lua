return {
    'nvim-telescope/telescope.nvim',

    branch = '0.1.x',

    dependencies = {
        { 'nvim-lua/plenary.nvim' },
        { 'kostoskistefan/ripgrep.nvim', version = '*', build = ':lua require("rg_setup").install_rg()' }
    },

    keys = {
        { '<leader>ff', function() require('telescope.builtin').find_files() end },
        { '<leader>fg', function() require('telescope.builtin').live_grep() end },
        { '<leader>fb', function() require('telescope.builtin').buffers() end },
        { '<leader>fh', function() require('telescope.builtin').help_tags() end },
    },
}

return {
    'nvim-telescope/telescope.nvim',

    branch = '0.1.x',

    dependencies = {
        { 'nvim-lua/plenary.nvim' },
        { 'kostoskistefan/ripgrep.nvim', version = '*', build = ':lua require("rg_setup").install_rg()' }
    },

    keys = {
        { '<leader>ff', require('telescope.builtin').find_files },
        { '<leader>fg', require('telescope.builtin').live_grep },
        { '<leader>fb', require('telescope.builtin').buffers },
        { '<leader>fh', require('telescope.builtin').help_tags },
    },
}

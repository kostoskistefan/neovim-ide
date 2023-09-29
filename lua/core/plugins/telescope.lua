return {
    'nvim-telescope/telescope.nvim', 
    tag = '0.1.3',
    dependencies = { 
        'nvim-lua/plenary.nvim'
    },
    keys = {
        {
            '<leader>ff',
            '<cmd>Telescope find_files<cr>'
        },
        {
            '<leader>fg',
            '<cmd>Telescope live_grep<cr>'
        },
    },
    config = function()
        require('telescope').setup()
    end
}

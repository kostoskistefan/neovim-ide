return {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },

    opts = {
        theme = 'onedark',
        icons_enabled = true,
    },

    config = function()
        require('lualine').setup(opts)

        -- Disable original statusline
        vim.opt.showmode = false
        vim.opt.cmdheight = 0
    end
}

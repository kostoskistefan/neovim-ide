return {
    'nvim-lualine/lualine.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons',
    },
    config = function()
        -- Hide vim command line when it's not used
        vim.opt.cmdheight = 0

        -- Hide Vim modes, since we are using an external statusline
        vim.opt.showmode = false

        require('lualine').setup({
            options = {
                theme = 'ayu_dark',
                globalstatus = true,
                icons_enabled = true,
                always_divide_middle = true,
                section_separators = { left = '', right = '' },
                component_separators = { left = '', right = '' },
            }
        })
    end
}

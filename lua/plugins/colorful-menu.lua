return {
    'xzbdmw/colorful-menu.nvim',

    config = function()
        require('colorful-menu').setup({
            ls = {
                clangd = {
                    extra_info_hl = "@comment",
                    import_dot_hl = "@comment",
                    align_type_to_right = true,
                    preserve_type_when_truncate = true,
                },
                fallback = true,
                fallback_extra_info_hl = "@comment",
            },

            fallback_highlight = "@variable",

            -- If provided, the plugin truncates the final displayed text to
            -- this width (measured in display cells). Any highlights that extend
            -- beyond the truncation point are ignored. When set to a float
            -- between 0 and 1, it'll be treated as percentage of the width of
            -- the window: math.floor(max_width * vim.api.nvim_win_get_width(0))
            -- Default 60.
            max_width = 60,
        })

        vim.api.nvim_set_hl(0, 'CmpItemAbbrMatch', { bold = true, fg = 'NONE' })
        vim.api.nvim_set_hl(0, 'BlinkCmpLabelMatch', { bold = true, fg = 'NONE' })
    end,
}

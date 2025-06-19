return {
    'akinsho/bufferline.nvim',
    version = '*',

    dependencies = {
        'echasnovski/mini.bufremove',
        'nvim-tree/nvim-web-devicons',
    },

    opts = {
        options = {
            themable = true,
            color_icons = true,
            diagnostics = 'nvim_lsp',
            diagnostics_update_on_event = true,
            separator_style = 'thin',
            offsets = {
                {
                    filetype = 'neo-tree',
                    text = 'File Explorer',
                    text_align = 'center',
                    separator = false
                }
            },
            diagnostics_indicator = function(_, _, diagnostics_dict, _)
                local s = ' '
                for e, n in pairs(diagnostics_dict) do
                    s = s .. n .. (e == 'error' and ' ' or (e == 'warning' and ' ' or ' '))
                end
                return s
            end,
            close_command = function(n) require("mini.bufremove").delete(n, false) end,
            right_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
            middle_mouse_command = function(n) require("mini.bufremove").delete(n, false) end,
        }
    }
}

local get_hex = require('cokeline/utils').get_hex

require('cokeline').setup({
    sidebar = {
        filetype = 'neo-tree',
        components = {
            {
                text = '  File Explorer',
                fg = get_hex('Normal', 'fg'),
                bg = get_hex('Normal', 'bg'),
                style = 'bold',
            },
        }
    },
})

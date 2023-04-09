require('lualine').setup {
    options = { 
        theme = 'ayu_dark',
        globalstatus = true,
        icons_enabled = true,
        always_divide_middle = true,
        section_separators = { left = '', right = '' },
        component_separators = { left = '', right = '' },
        extensions = { 'neo-tree' },
    }
}

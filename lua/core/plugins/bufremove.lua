return {
    'echasnovski/mini.bufremove',
    version = '*',
    keys = {
        {
            '<C-w>',
            function()
                require("mini.bufremove").delete(0, false)
            end
        }
    },
    config = function()
        require('mini.bufremove').setup()
    end
}

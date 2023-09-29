return {
    'echasnovski/mini.comment',
    version = '*',
    keys = {
        {
            '<C-_>',
            'gcc',
            mode = 'n',
            remap = true
        },
        {
            '<C-_>',
            'gc',
            mode = 'v',
            remap = true
        },
    },
    config = function()
        require('mini.comment').setup()
    end
}

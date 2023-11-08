return {
    'numToStr/Comment.nvim',
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
        require('Comment').setup({ ignore = '^$' })
        require('Comment.ft').set('vala', '// %s')
    end
}

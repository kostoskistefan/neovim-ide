return { 
    'Shatur/neovim-ayu',
    config = function()
        require('ayu')
        vim.cmd('colorscheme ayu-dark')
    end
}

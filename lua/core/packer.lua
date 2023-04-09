local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerCompile
  augroup end
]])

return require('packer').startup(function(use)
    use({ 'wbthomason/packer.nvim' })

    -- UI
    use({ 'Shatur/neovim-ayu' })
    use({ 'nvim-tree/nvim-web-devicons'} )
    use({ 'willothy/nvim-cokeline',    requires = 'nvim-tree/nvim-web-devicons' })
    use({ 'nvim-lualine/lualine.nvim', requires = 'nvim-tree/nvim-web-devicons' })
    use({ 'onsails/lspkind.nvim' })
    use({
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    })

    -- LSP / Completion
    use({ 'neovim/nvim-lspconfig' })
    use({ 'hrsh7th/cmp-nvim-lsp' })
    use({ 'hrsh7th/cmp-buffer' })
    use({ 'hrsh7th/cmp-path' })
    use({ 'hrsh7th/cmp-cmdline' })
    use({ 'hrsh7th/nvim-cmp' })
    use({ 'lukas-reineke/cmp-rg' })
    use({ 'andersevenrud/cmp-tmux' })
    use({ 'L3MON4D3/LuaSnip', tag = 'v<CurrentMajor>.*', run = 'make install_jsregexp' })
    use({ 'saadparwaiz1/cmp_luasnip' })
    use({ 'rafamadriz/friendly-snippets' })
    use({ 'jose-elias-alvarez/null-ls.nvim' })
    use({ 'williamboman/mason.nvim', run = ':MasonUpdate', })

    -- Files
    use({ 'nvim-telescope/telescope.nvim', requires = 'nvim-lua/plenary.nvim' })
    use({
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v2.x',
        requires = { 
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons',
            'MunifTanjim/nui.nvim',
        }
    })

    -- Plugins that make your life easier 
    use({ 'NvChad/nvterm' })
    use({ 'numToStr/Comment.nvim' })
    use({ 'windwp/nvim-autopairs' })
    use({ 'mg979/vim-visual-multi',  branch = 'master' })

    if packer_bootstrap then
        require('packer').sync()
    end
end)

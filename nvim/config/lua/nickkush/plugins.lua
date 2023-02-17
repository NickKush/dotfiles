
-- Auto install packer.nvim before using it
-- From: https://github.com/wbthomason/packer.nvim#bootstrapping
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'

    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd('packadd packer.nvim')
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()


return require('packer').startup(function()
    use('wbthomason/packer.nvim')

    -- Color scheme
    -- use('gruvbox-community/gruvbox')
    use({ "catppuccin/nvim", as = "catppuccin" })

    -- QoL
    use('tpope/vim-commentary')   -- Comments
    use('tpope/vim-surround')     -- brackets, quotes and etc

    -- Gui echancements
    -- use('machakann/vim-highlightedyank')
    use('nvim-lualine/lualine.nvim')
    use('kyazdani42/nvim-web-devicons')

    -- LSP
    use('williamboman/nvim-lsp-installer') -- lsp server installer
    use('neovim/nvim-lspconfig')           -- main lsp plugin for EVERYTHING
    use('jose-elias-alvarez/null-ls.nvim') -- language server
    use('ray-x/lsp_signature.nvim')        -- Function signatures

    -- Treesitter
    use({
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    })
    use('nvim-treesitter/nvim-treesitter-context')  -- context of currently visible content

    -- Autocomplete
    use('hrsh7th/cmp-nvim-lsp')
    use('hrsh7th/cmp-buffer')
    use('hrsh7th/cmp-path')
    use('hrsh7th/cmp-cmdline')
    use('hrsh7th/nvim-cmp')

    -- Snippets
    use('L3MON4D3/LuaSnip')
    use('saadparwaiz1/cmp_luasnip')

    -- Telescope
    use({
        'nvim-telescope/telescope.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
    })

    -- Scala
    use({
        'scalameta/nvim-metals',
        requires = {{ "nvim-lua/plenary.nvim" }}
    })

    -- File tree
    use('kyazdani42/nvim-tree.lua')

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)

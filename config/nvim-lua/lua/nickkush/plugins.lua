
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
    use 'wbthomason/packer.nvim'
    
    -- Color scheme
    use "gruvbox-community/gruvbox"

    -- QoL
    use("tpope/vim-commentary")   -- Comments
    use("tpope/vim-surround")     -- brackets, quotes and etc
    
    -- Gui echancements
    use "machakann/vim-highlightedyank"
    use "nvim-lualine/lualine.nvim"
    use "kyazdani42/nvim-web-devicons"

    -- LSP
    use "williamboman/nvim-lsp-installer"  -- lsp server installer
    use "neovim/nvim-lspconfig"   -- enable lsp
    use ("jose-elias-alvarez/null-ls.nvim") -- language server
    
    -- autocomplete
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/nvim-cmp"

    -- Telescope 
    use {
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/plenary.nvim" } },
    }

    -- File tree
    use "kyazdani42/nvim-tree.lua"

    use("nvim-treesitter/nvim-treesitter")
end)

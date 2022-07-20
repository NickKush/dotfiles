
vim.cmd("packadd packer.nvim")

return require('packer').startup(function()
    use("wbthomason/packer.nvim")
    
    -- Color scheme
    use("gruvbox-community/gruvbox")

    -- QoL
    use("tpope/vim-commentary")   -- Comments
    use("tpope/vim-surround")     -- brackets, quotes and etc
    
    -- Gui echancements
    use("machakann/vim-highlightedyank")
    use("nvim-lualine/lualine.nvim")
    use("kyazdani42/nvim-web-devicons")

    -- LSP
    use("williamboman/nvim-lsp-installer") -- lsp server installer
    use("neovim/nvim-lspconfig")           -- main lsp plugin for EVERYTHING 
    use("jose-elias-alvarez/null-ls.nvim") -- language server
    use("ray-x/lsp_signature.nvim")        -- Function signatures

    -- Treesitter 
    use("nvim-treesitter/nvim-treesitter")
    
    -- Autocomplete
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/nvim-cmp")

    -- Snippets
    use("L3MON4D3/LuaSnip")
    use("saadparwaiz1/cmp_luasnip")

    -- Telescope 
    use({
        "nvim-telescope/telescope.nvim",
        requires = { 
            { "nvim-lua/plenary.nvim" } 
        },
    })

    -- File tree
    use("kyazdani42/nvim-tree.lua")
end)

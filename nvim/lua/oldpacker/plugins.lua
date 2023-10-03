-- Auto install packer.nvim before using it
-- From: https://github.com/wbthomason/packer.nvim#bootstrapping
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"

    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
        vim.cmd("packadd packer.nvim")
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()


return require("packer").startup(function()
    use("wbthomason/packer.nvim")

    -- Color scheme
    -- DONE
    use({
        "catppuccin/nvim",
        as = "catppuccin",
        tag = "1.4.0"
    })


    -- Gui echancements
    use({"nvim-lualine/lualine.nvim", commit = "45e27ca"})

    -- File explorer
    use({
        "kyazdani42/nvim-tree.lua",
        commit = "5897b36"
    }) --
    use({
        "nvim-telescope/telescope.nvim",
        tag = "0.1.2",
        requires = { "nvim-lua/plenary.nvim" },
    })

    -- Comments
    use({"tpope/vim-commentary", commit = "e87cd90"})
    use({"tpope/vim-surround", commit = "3d188ed"})     -- brackets, quotes and etc

    -- Autocomplete
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/nvim-cmp")
    use("saadparwaiz1/cmp_luasnip")

    -- Snippets
    use("L3MON4D3/LuaSnip")

    -- Fuzzy finder
    -- Git blame
    use({"f-person/git-blame.nvim", commit = "41e22dc"})

    -- Treesitter
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate"
    })
    use("nvim-treesitter/nvim-treesitter-context")  -- context of currently visible content

    use("williamboman/nvim-lsp-installer") -- lsp server installer
    use("neovim/nvim-lspconfig")           -- main lsp plugin for EVERYTHING
    use("ray-x/lsp_signature.nvim")        -- Function signatures
    -- LSP
    use("jose-elias-alvarez/null-ls.nvim") -- language server
    -- END DONE



    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require("packer").sync()
    end
end)

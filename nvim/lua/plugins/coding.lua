return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      "bash",
      "c",
      "css",
      "diff",
      "html",
      "javascript",
      "jsdoc",
      "json",
      "jsonc",
      "lua",
      "luadoc",
      "luap",
      "markdown",
      "markdown_inline",
      "printf",
      "python",
      "query",
      "regex",
      "rust",
      "toml",
      "tsx",
      "typescript",
      "vim",
      "vimdoc",
      "xml",
      "yaml",
    },
  },

  -- log file highlight
  {
    "fei6409/log-highlight.nvim",
    config = function()
      require("log-highlight").setup({})
    end,
  },

  -- NOTE: temporary. waiting for https://github.com/LazyVim/LazyVim/pull/5829/files to be merged
  {
    "linux-cultist/venv-selector.nvim",
    enabled = true,
    -- enabled = function()
    --   return LazyVim.has("telescope.nvim")
    -- end,
  },

  { "echasnovski/mini.pairs", enabled = false },
}

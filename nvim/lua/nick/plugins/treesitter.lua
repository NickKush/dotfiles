return {

  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    event = { "BufReadPost", "BufNewFile" },

    -- cmd = "TSUpdateSync",

    opts = {
      ensure_installed = {
          'bash', 'css', 'html', 'javascript', 'json', 'markdown',
          'lua', 'typescript', 'vim', 'vimdoc', 'vue', 'yaml'
      },


      highlight = { enable = true },
      indent = { enable = true },
    },

    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,

  },

  -- context of current content
  {
    "nvim-treesitter/nvim-treesitter-context",

    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },

    opts = {
      enable = true,

      patterns = {  -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
        default = {
         'class',
         'function',
         'method'
        }
      }
    }
  }
}

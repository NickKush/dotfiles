return {
  {
    -- File tree
    "nvim-neo-tree/neo-tree.nvim",
    keys = function()
      return {
        {
          "<F2>",
          function()
            require("neo-tree.command").execute({ toggle = true, dir = require("lazyvim.util").root() })
          end,
        },
        {
          "<leader>e",
          function()
            require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
          end,
        },
      }
    end,
  },

  {
    -- Search
    "ibhagwan/fzf-lua",
    opts = {
      fzf_opts = {
        ["--history"] = vim.fn.stdpath("data") .. "/fzf-lua-history",
        ["--history-size"] = 100,
      },
    },
  },
}

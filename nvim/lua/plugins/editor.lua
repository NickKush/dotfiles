return {
  -- file tree
  {
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

  -- enchanced search
  -- TODO: needed?
  {
    "folke/flash.nvim",
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
    -- { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
    -- { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    -- { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    enabled = false,
  },
}

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
    "nvim-telescope/telescope.nvim",
    keys = function()
      local builtin = require("telescope.builtin")

      return {
        { "<leader>/", builtin.live_grep, desc = "Live Grep" },
        { "<leader>n", builtin.find_files, desc = "Find Files" },
        { "<leader>,", builtin.buffers, desc = "Switch Buffer" },
        { "<F12>", builtin.help_tags, desc = "Help Pages" },
      }
    end,

    opts = function(_, opts)
      local builtin = require("telescope.builtin")
      local actions = require("telescope.actions")

      local find_files_all = function()
        local action_state = require("telescope.actions.state")
        local line = action_state.get_current_line()
        builtin.find_files({ hidden = true, no_ignore = true, default_text = line })
      end

      opts.defaults.mappings = {
        i = {
          ["<C-["] = find_files_all,

          ["<C-Down>"] = actions.cycle_history_next,
          ["<C-Up>"] = actions.cycle_history_prev,

          ["<C-f>"] = actions.preview_scrolling_down,
          ["<C-b>"] = actions.preview_scrolling_up,

          ["<C-j>"] = actions.move_selection_next,
          ["<C-k>"] = actions.move_selection_previous,
        },
        n = {
          ["q"] = actions.close,
        },
      }

      opts.pickers = {
        find_files = {
          previewer = false,
        },

        buffers = {
          theme = "dropdown",
          previewer = false,
        },
      }
    end,
  },

  {
    "lewis6991/gitsigns.nvim",
    enabled = false,
  },
  {
    "folke/todo-comments.nvim",
    enabled = false,
  },
}

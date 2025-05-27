return {
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      local lazyvim_lualine = require("lazyvim.util.lualine")
      local icons = require("lazyvim.config").icons

      opts.sections.lualine_b = { lazyvim_lualine.root_dir() }

      opts.sections.lualine_c = {
        {
          "diagnostics",
          symbols = {
            error = icons.diagnostics.Error,
            warn = icons.diagnostics.Warn,
            info = icons.diagnostics.Info,
            hint = icons.diagnostics.Hint,
          },
        },
        { lazyvim_lualine.pretty_path() },
      }

      -- remove git status
      table.remove(opts.sections.lualine_x, 4)

      opts.sections.lualine_y = { "branch" }
      opts.sections.lualine_z = {
        { "progress", separator = " ", padding = { left = 0, right = 0 } },
        { "location", padding = { left = 0, right = 1 } },
      }
    end,
  },

  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
      { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
      { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
      { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
      { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
      { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
      { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
      { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
      { "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
      { "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
    },
    opts = {
      options = {
        show_buffer_close_icons = false,
      },
    },
  },

  {
    "folke/noice.nvim",
    enabled = false,
  },

  -- notifications
  {
    "snacks.nvim",
    keys = {
      {
        "<leader>'",
        function()
          if Snacks.config.picker and Snacks.config.picker.enabled then
            Snacks.picker.notifications()
          else
            Snacks.notifier.show_history()
          end
        end,
        desc = "Notification History",
      },
      {
        "<leader>un",
        function()
          Snacks.notifier.hide()
        end,
        desc = "Dismiss All Notifications",
      },
    },
  },
}

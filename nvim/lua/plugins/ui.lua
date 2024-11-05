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
    keys = function()
      return {
        { "<space>t", "<Cmd>BufferLinePick<CR>", desc = "Buffer picker" },
        { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
        { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
      }
    end,
    opts = {
      options = {
        show_buffer_close_icons = false,
      },
    },
  },

  {
    "nvimdev/dashboard-nvim",
    opts = function(_, opts)
      local logo = ""

      -- margin top
      logo = string.rep("\n", 16) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },

  {
    "folke/noice.nvim",
    enabled = false,
  },
}

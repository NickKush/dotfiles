return {
  {
    "kyazdani42/nvim-tree.lua",
    lazy = false,

    keys = {
      {
        "<F2>", function()
          require("nvim-tree.api").tree.toggle()
        end,
      }
    },

    opts = {
      renderer = {
        highlight_git = false,
        -- highlight_opened_files = "name",

        icons = {
          webdev_colors = true,
          show = {
            git = false
          },
        }
      },

      view = {
        width = 25,
        side = "left",
        number = true,
        relativenumber = true,
        signcolumn = "no"
      }
    },

    config = function(_, opts)
      require('nvim-tree').setup(opts)
    end,
  },


  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.3",
    cmd = "Telescope",

    dependencies = {
      "nvim-lua/plenary.nvim"
    },

    keys = function()
      local builtin = require('telescope.builtin')

      return {
        { "<leader>n", builtin.find_files },
        { "<f12>",     builtin.help_tags },
        { "<leader>f", builtin.live_grep },
        { "<leader>b", builtin.buffers },
        { "<leader>]", function()
          builtin.find_files({ hidden = true, no_ignore = true })
        end }
      }
    end,

    opts = function()
      local actions = require('telescope.actions')

      return {
        defaults = {
          file_ignore_patterns = {
            ".git/",
            "node_modules/",
            "venv*/",
            "__pycache__/",
            "htmlcov/",
            "migrations/"
          },

          layout_config = {
            horizontal = {
              prompt_position = "bottom"
            },
          },

          mappings = {
            i = {
              ["<C-n>"] = actions.cycle_history_next,
              ["<C-p>"] = actions.cycle_history_prev,

              ["<Right>"] = actions.cycle_history_next,
              ["<Left>"] = actions.cycle_history_prev,

              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,

              ["<Down>"] = actions.move_selection_next,
              ["<Up>"] = actions.move_selection_previous,

              ["<C-c>"] = actions.close,

              ["<C-u>"] = actions.results_scrolling_up,
              ["<C-d>"] = actions.results_scrolling_down,

              ["<PageUp"] = actions.preview_scrolling_up,
              ["<PageDown>"] = actions.preview_scrolling_down,
            },

            n = {
              ["<Esc>"] = actions.close,

              ["<j>"] = actions.move_selection_next,
              ["<k>"] = actions.move_selection_previous,

              ["<gg>"] = actions.move_to_top,
              ["<M>"] = actions.move_to_middle,
              ["<G>"] = actions.move_to_bottom,

              ["<C-u>"] = actions.preview_scrolling_up,
              ["<C-d>"] = actions.preview_scrolling_down,

              ["<PageUp"] = actions.results_scrolling_up,
              ["<PageDown>"] = actions.results_scrolling_down,
            }
          }
        },

        pickers = {
          find_files = {
            previewer = false
          },

          buffers = {
            theme = "dropdown",
            previewer = false,
          }
        }
      }
    end,
  },

  -- git blame
  {
    "f-person/git-blame.nvim",
    lazy = true,
    cmd = "GitBlameToggle",

    opts = {
      enabled = 0,
    },
  }
}

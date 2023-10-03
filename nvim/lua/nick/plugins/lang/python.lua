-- local function get_python_path(workspace)
--   local util = require("lspconfig/util")
--   local path = util.path

--   -- Use activated venv
--   if vim.env.VIRTUAL_ENV then
--     return path.join(vim.env.VIRTUAL_ENV, 'bin', 'python3')
--   end

--   -- Find and use virtualenv in workspace directory.
--   for _, pattern in ipairs({'*', '.*'}) do
--     local match = vim.fn.glob(path.join(workspace, pattern, 'pyvenv.cfg'))
--     if match ~= '' then
--       return path.join(path.dirname(match), 'bin', 'python3')
--     end
--   end

--   -- Fallback to system Python.
--   return exepath('python3') or exepath('python') or 'python3' or 'python'
-- end

-- TODO: use linux-cultist/venv-selector.nvim?
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          -- on_init = function(client)
          --   if server == "pyright" then
          --       client.config.settings.python.pythonPath = get_python_path(client.config.root_dir)
          --   end
          -- end,
        },
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",

    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, { "python" })
    end,
  },

  -- dap
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      {
          "mfussenegger/nvim-dap-python",
          config = function()
            local path = require("mason-registry").get_package("debugpy"):get_install_path()
            require("dap-python").setup(path .. "/venv/bin/python")
          end,
      },
        {
            -- "jay-babu/mason-nvim-dap.nvim",
            "williamboman/mason.nvim",
            opts = function(_, opts)
                vim.list_extend(opts.ensure_installed, { "debugpy" })
            end,
        }
    }
  },

  {
    "linux-cultist/venv-selector.nvim",
    cmd = "VenvSelect",
    opts = function(_, opts)
      opts.dap_enabled = true
      return vim.tbl_deep_extend("force", opts, {
        name = {
          "venv",
          ".venv",
          "env",
          ".env",
        },
      })
    end,
    keys = { { "<leader>cv", "<cmd>:VenvSelect<cr>", desc = "Select VirtualEnv" } },
  },

}

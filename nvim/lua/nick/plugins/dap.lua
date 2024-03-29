return {
    -- debugger
    {
        "mfussenegger/nvim-dap",

        dependencies = {
            { "rcarriga/nvim-dap-ui" },
            -- {
            --     "jay-babu/mason-nvim-dap.nvim",
            --     dependencies = "mason.nvim",
            --     opts = {
            --         automatic_installation = true,
            --         ensure_installed = {}
            --     }
            -- },
        },
    },

    -- UI
    {
        "rcarriga/nvim-dap-ui",
        opts = {
           controls = {
              icons = {
                disconnect = "",
                pause = "⏸",
                play = "▶",
                run_last = "↻",
                step_back = "↶",
                step_into = "⇣",
                step_out = "⇡",
                step_over = "↷",
                terminate = "⏹"
            }
          },

          icons = {
            collapsed = "▸",
            current_frame = "▸",
            expanded = "▾"
          },
        },
        config = function(_, opts)
            local dap = require("dap")
            local dapui = require("dapui")
            dapui.setup(opts)
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open({})
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close({})
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close({})
            end
        end,
    },
}

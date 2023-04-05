local success, telescope = pcall(require, 'telescope')
if not success then
    return
end

local actions = require('telescope.actions')
local builtin = require('telescope.builtin')

local ignore_files = {
    ".git/",
    "node_modules/",
    "venv*/",
    "__pycache__/",
    "htmlcov/",
    "migrations/"
}


-- Keymaps
local keymap = vim.keymap.set

keymap('n', '<leader>n', builtin.find_files, {})
keymap('n', '<F12>',     builtin.help_tags, {})
keymap("n", "<leader>f", builtin.live_grep, {})
keymap("n", "<leader>b", builtin.buffers, {})

keymap("n", "<leader>]", function()
    builtin.find_files({ hidden = true, no_ignore = true })
end, {})


-- Setup
telescope.setup {
    defaults = {
        file_ignore_patterns = ignore_files,

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

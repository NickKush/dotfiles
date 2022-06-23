local success, telescope = pcall(require, 'telescope')
if not success then
    return
end

local actions = require('telescope.actions')

local ignore_files = {
    ".git/",
    "node_modules/",
    "venv*/",

}


telescope.setup {
    defaults = {
        file_ignore_patterns = ignore_files,

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
    }
}

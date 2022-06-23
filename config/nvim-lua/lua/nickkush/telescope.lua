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

        -- mappings = {
        -- }
    }
}

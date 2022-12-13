local success, nvim_tree = pcall(require, 'nvim-tree')
if not success then
    return
end

local keymap = vim.keymap.set

keymap('n', '<F2>', nvim_tree.toggle, {})

-- Set folder color
vim.cmd("highlight NvimTreeFolderName guifg=lightgray")
vim.cmd("highlight NvimTreeOpenedFolderName guifg=darkgray")
vim.cmd("highlight NvimTreeEmptyFolderName guifg=gray")

nvim_tree.setup {
    renderer = {
        highlight_git = true,
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
}



local create_autocmd = vim.api.nvim_create_autocmd

-- Highlight visualization on yank
create_autocmd({ "TextYankPost" }, {
    callback = function()
        vim.highlight.on_yank({
            higroup = "Visual",
            timeout = 200
        })
    end,
})

-- Change mode to "insert" when we enter in terminal
create_autocmd({ "BufEnter" }, {
    pattern = { "term://*" },
    callback = function()
        vim.cmd("startinsert!")
    end,
})


-- Remove all trailing spaces
create_autocmd({ "BufWritePre" }, {
    pattern = "*",
    command = "%s/\\s\\+$//e",
})

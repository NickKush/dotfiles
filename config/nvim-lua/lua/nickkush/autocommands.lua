
-- Highlight visualization on yank
vim.api.nvim_create_autocmd({ "TextYankPost" }, {
    callback = function()
        vim.highlight.on_yank({
            higroup = "Visual",
            timeout = 200
        })
    end,
})

-- Change mode to "insert" when we enter in terminal
vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "term://*" },
    callback = function() 
        vim.cmd("startinsert!")
    end, 
})


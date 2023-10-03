local success, git_blame = pcall(require, 'gitblame')
if not success then
    return
end

vim.g.gitblame_enabled = 0


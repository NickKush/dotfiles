local success, null_ls = pcall(require, "null-ls")
if not success then
  return
end


null_ls.setup({
    sources = {
        -- null_ls.builtins.diagnostics.pylint,
        -- null_ls.builtins.diagnostics.flake8
    }
})


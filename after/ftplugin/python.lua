local function py()
  vim.cmd("sp term://ipython")
end

vim.b.vimpipe_command = "python -"
vim.o.foldmethod = "indent"
vim.opt_local.foldlevelstart = 0

vim.api.nvim_create_user_command("Py", function(_)
  py()
end, {})

-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
vim.keymap.set("n", "<TAB>", "<C-W><C-W>")

vim.keymap.set("n", "<leader>gb", function()
  -- Open a bottom split
  vim.cmd("botright split")
  vim.cmd("resize 15")

  -- Start terminal with Git Bash directly
  vim.cmd([[terminal "C:/Users/]] .. os.getenv("USERNAME") .. [[/scoop/apps/git/current/bin/bash.exe" --login -i]])
end, {
  desc = "Open Git Bash",
})

vim.keymap.set("n", "<localleader>b", ":AsyncTask build<CR>", { desc = "Build" })
vim.keymap.set("n", "<localleader>r", ":AsyncTask run<CR>", { desc = "Run" })
vim.keymap.set("n", "<localleader>t", ":AsyncTask test<CR>", { desc = "Test" })
vim.keymap.set("n", "<localleader>w", ":AsyncTask watch<CR>", { desc = "Watch" })
vim.keymap.set("n", "<localleader>c", ":AsyncTask clean<CR>", { desc = "Clean" })
vim.keymap.set("n", "<localleader>e", ":AsyncTaskEdit<CR>", { desc = "Clean" })
vim.keymap.set("n", "<localleader>m", ":AsyncTaskMacro<CR>", { desc = "Clean" })

vim.keymap.set("n", "<localleader>a", ":AsyncTaskList<CR>", { desc = "Task List" })

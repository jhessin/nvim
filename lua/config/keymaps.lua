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
vim.keymap.set("n", "<localleader>c", ":AsyncTask clean<CR>", { desc = "Clean" })
vim.keymap.set("n", "<localleader>e", ":AsyncTaskEdit<CR>", { desc = "Edit Async Tasks" })
vim.keymap.set("n", "<localleader>m", ":AsyncTaskMacro<CR>", { desc = "List Task Macros" })
vim.keymap.set("n", "<localleader>s", ":AsyncTask shell<CR>", { desc = "Open a shell" })

vim.keymap.set("n", "<localleader>a", ":AsyncTaskList<CR>", { desc = "Task List" })

vim.keymap.set("n", "<localleader>p", ":AsyncTaskProfile ", { desc = "Set or check the Async Profile" })

local autorun = false

vim.keymap.set("n", "<localleader>w", function()
  autorun = not autorun
  print("Auto-run is now", autorun and "ON" or "OFF")
end, {
  desc = "Watch mode",
})

vim.api.nvim_create_autocmd("BufWritePost", {
  -- pattern = "*.py",
  callback = function()
    if autorun then
      vim.cmd("AsyncTask run")
    end
  end,
})

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

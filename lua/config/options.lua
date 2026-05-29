-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.o.mouse = "nv"
vim.o.wrap = true
vim.o.exrc = true

vim.keymap.set("n", "<leader>um", function()
  require("render-markdown").toggle()
end, { desc = "Render Markdown" })

vim.g.maplocalleader = ","

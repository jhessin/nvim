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

vim.api.nvim_create_user_command("WatchRun", function()
  local overseer = require("overseer")
  overseer.run_task({ name = "run script", autostart = false }, function(task)
    if task then
      task:add_component({ "restart_on_save", paths = { vim.fn.expand("%:p") } })
      task:start()
      task:open_output("vertical")
    else
      vim.notify("WatchRun not supported for filetype " .. vim.bo.filetype, vim.log.levels.ERROR)
    end
  end)
end, {})

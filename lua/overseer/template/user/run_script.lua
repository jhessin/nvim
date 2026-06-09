-- config/nvim/lua/overseer/template/user/run_script.lua
return {
  name = "run script",
  builder = function()
    local file = vim.fn.expand("%:p")
    local cmd = { file }
    if vim.bo.filetype == "go" then
      cmd = { "go", "run", file }
    elseif vim.bo.filetype == "python" then
      cmd = { "python", file }
    end
    return {
      cmd = cmd,
      -- add some components that will pipe the output to quickfix,
      -- parse it using errorformat, and display any matching lines as diagnostics.
      strategy = "jobstart",

      components = {
        "default",
        { "restart_on_save", paths = { vim.fn.expand("%:p") } },
        { "on_output_quickfix", open = false },
        "on_exit_set_status",
        "on_complete_notify",
        "open_vertical",
      },
      env = {
        PYTHONPATH = vim.fn.getcwd(),
      },
    }
  end,
  condition = {
    filetype = { "sh", "python", "go" },
  },
}

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
      cwd = vim.fs.dirname(vim.fs.find("__init__.py", { path = vim.fn.getcwd(), upward = true })[1]),
      env = {
        PYTHONPATH = vim.fs.dirname(vim.fs.find("__init__.py", { path = vim.fn.getcwd(), upward = true })[1]),
      },
      -- strategy = {
      --   "terminal",
      --   direction = "vertical",
      --   close_on_exit = "false",
      -- },

      components = {
        "unique",
        { "restart_on_save", paths = { vim.fn.expand("%:p") } },
        -- {
        --   "open_output",
        --   direction = "dock",
        --   -- focus = false,
        --   -- on_complete = "always",
        --   -- on_result = "always",
        --   on_start = "always",
        -- },
      },
    }
  end,
  condition = {
    filetype = { "sh", "python", "go" },
  },
}

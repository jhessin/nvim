-- config/nvim/lua/overseer/template/user/run_script.lua
return {
  name = "Gradle: run (app)",
  builder = function()
    local cmd = { "./gradlew" }
    local args = { ":app:run" }
    return {
      cmd = cmd,
      args = args,
      cwd = vim.fn.getcwd(),
      components = {
        "default",
        { "restart_on_save", paths = { vim.fn.expand("%:p") } },
        { "on_output_quickfix", set_diagnostics = true },
        "on_result_diagnostics",
        "open_vertical",
      },
    }
  end,
  condition = {
    filetype = { "kt" },
  },
}

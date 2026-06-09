return {
  name = "Gradle: test (utils)",
  builder = function()
    return {
      cmd = { "./gradlew" },
      args = { ":utils:test" },
      cwd = vim.fn.getcwd(),
    }
  end,
  condition = {
    filetype = { "kotlin" },
  },
}

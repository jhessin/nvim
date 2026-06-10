return {
  name = "Gradle: test (utils)",
  builder = function()
    return {
      cmd = { "./gradlew" },
      args = { ":utils:test" },
      cwd = vim.fs.dirname(vim.fs.find(".git", { path = vim.fn.getcwd(), upward = true })[1]),
    }
  end,
  condition = {
    filetype = { "kotlin" },
  },
}

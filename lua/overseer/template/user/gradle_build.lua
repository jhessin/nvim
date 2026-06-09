return {
  name = "Gradle: build (root)",
  builder = function()
    return {
      cmd = { "./gradlew" },
      args = { "build" },
      cwd = vim.fn.getcwd(),
    }
  end,
  condition = {
    filetype = { "kotlin" },
  },
}

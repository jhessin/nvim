return {
  name = "Gradle: build (root)",
  builder = function()
    return {
      cmd = { "./gradlew" },
      args = { "build" },
      cwd = vim.fs.dirname(vim.fs.find(".git", { path = vim.fn.getcwd(), upward = true })[1]),
    }
  end,
  condition = {
    filetype = { "kotlin" },
  },
}

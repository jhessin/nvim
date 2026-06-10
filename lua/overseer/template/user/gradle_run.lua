return {
  name = "Gradle: run (app)",
  builder = function()
    print("USING MY TEMPLATE")
    local gradlew = vim.fs.find("gradlew", {
      path = vim.fn.expand("%:p:h"),
      upward = true,
    })[1]

    -- If this is nil, we bail early
    if not gradlew then
      vim.notify("No gradlew found", vim.log.levels.ERROR)
      return
    end

    local gradle_root = vim.fs.dirname(gradlew)

    local components = {
      { "unique" },
      { "restart_on_save", paths = { vim.fn.expand("%:p") } },
      -- {
      --   "gradle_terminal",
      --   gradle_root = gradle_root,
      --   gradle_cmd = "gradlew.bat :app:run",
      -- },
    }

    -- print("COMPONENTS RAW =", vim.inspect(components))

    return {
      cmd = { "./gradlew" },
      args = { "run" },
      cwd = gradle_root,

      components = components,
    }
  end,
  condition = {
    filetype = { "kotlin" },
  },
}

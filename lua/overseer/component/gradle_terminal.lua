local M = {}

M.desc = "Run Gradle inside a terminal split (Windows compatible)"

M.constructor = function(opts)
  print("gradle_terminal opts =", vim.inspect(opts))
  -- FIX: Overseer wraps your opts inside opts.opts
  local gradle_root = opts.opts and opts.opts.gradle_root
  local gradle_cmd = opts.opts and opts.opts.gradle_cmd or "gradlew.bat :app:run"

  return {
    on_start = function(self, task)
      vim.notify("gradle_terminal: " .. vim.inspect(opts))
      if not gradle_root then
        vim.notify("gradle_terminal: gradle_root is nil", vim.log.levels.ERROR)
        return
      end

      vim.cmd("vsplit | terminal")

      vim.defer_fn(function()
        local job = vim.b.terminal_job_id
        if not job then
          vim.notify("gradle_terminal: terminal job not ready", vim.log.levels.ERROR)
          return
        end

        vim.fn.chansend(job, "cd /d " .. gradle_root .. "\r")
        vim.fn.chansend(job, gradle_cmd .. "\r")
      end, 50)
    end,
  }
end

return M

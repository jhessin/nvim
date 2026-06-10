return {
  "stevearc/overseer.nvim",
  version = "*",
  opts = {
    templates = { "builtin", "gradlew" },
    task_list = {
      default_detail = 1,
    },
  },
  config = function(_, opts)
    local overseer = require("overseer")
    overseer.setup(opts)

    -- overseer.register_component("gradle_terminal", require("overseer.components.gradle_terminal"))
  end,
  keys = {
    -- Open task picker (like IntelliJ’s “Run Anything”)
    { "<localleader>r", "<cmd>OverseerRun<cr>", desc = "Run Overseer Task" },

    -- Toggle task list panel
    { "<localleader>t", "<cmd>OverseerToggle<cr>", desc = "Toggle Task List" },

    -- Quick actions (stop, open logs, etc.)
    { "<localleader>a", "<cmd>OverseerTaskAction<cr>", desc = "Task Quick Actions" },

    -- Open task output in a floating window
    { "<localleader>o", "<cmd>OverseerOpen<cr>", desc = "Open Task Output" },
  },
}

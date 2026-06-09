return {
  {
    "stevearc/overseer.nvim",
    config = function()
      require("overseer").setup()
    end,
    opts = {
      templates = { "builtin", "gradlew" },
      task_list = {
        default_detail = 1,
      },
    },
    keys = {
      -- Open task picker (like IntelliJ’s “Run Anything”)
      { "<leader>or", "<cmd>OverseerRun<cr>", desc = "Run Overseer Task" },

      -- Toggle task list panel
      { "<leader>ot", "<cmd>OverseerToggle<cr>", desc = "Toggle Task List" },

      -- Quick actions (stop, open logs, etc.)
      { "<leader>oa", "<cmd>OverseerTaskAction<cr>", desc = "Task Quick Actions" },

      -- Open task output in a floating window
      { "<leader>oo", "<cmd>OverseerOpen<cr>", desc = "Open Task Output" },
    },
  },
}

return {
  {
    "skywind3000/asynctasks.vim",
    dependencies = {
      "skywind3000/asyncrun.vim",
    },
    config = function()
      vim.g.asynctasks_term_pos = "right"
      vim.g.asynctasks_term_reuse = 1
      vim.g.asynctasks_term_focus = 0
      vim.g.asynctasks_term_close = 0
      vim.g.asynctasks_extra_config = { "~/.config/nvim/tasks.ini" }
    end,
  },
}

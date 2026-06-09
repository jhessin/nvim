return {
  "stevearc/overseer.nvim",
  version = "*",
  opts = {},
  config = function()
    local overseer = require("overseer")

    overseer.register_component("open_vertical", require("overseer.component.open_vertical"))
  end,
}

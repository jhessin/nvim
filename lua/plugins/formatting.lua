return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      toml = { "taplo" },
      python = { "ruff", "black" },
      tcss = { "tcssfmt" },
    },
    formatters = {
      taplo = {
        command = "taplo",
        args = { "fmt", "$FILENAME" },
        stdin = false,
      },
      tcssfmt = {
        command = "tcssfmt.cmd",
        -- args = {
        --   "~/.local/bin/tcssfmt",
        -- },
        stdin = true,
      },
    },
  },
}

return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      toml = { "taplo" },
      python = { "ruff", "black" },
    },
    formatters = {
      taplo = {
        command = "taplo",
        args = { "fmt", "$FILENAME" },
        stdin = false,
      },
    },
  },
}

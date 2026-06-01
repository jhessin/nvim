return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      toml = { "taplo" },
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

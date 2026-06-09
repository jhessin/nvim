-- lua/plugins/kotlin.lua
return {
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "kotlin-language-server" } },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        kotlin_language_server = {
          root_dir = function(fname)
            local util = require("lspconfig.util")
            local root =
              util.root_pattern("settings.gradle", "settings.gradle.kts", "build.gradle", "build.gradle.kts")(fname)

            if type(root) == "string" then
              return root
            end

            return vim.fs.dirname(vim.fs.find(".git", { path = fname, upward = true })[1])
          end,
        },
      },
    },
  },
  {
    "stevearc/overseer.nvim",
    opts = {
      templates = { "builtin", "gradle" },
    },
  },
  {
    "mfussenegger/nvim-dap",
    dependencies = { "mfussenegger/nvim-jdtls" },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        kotlin = { "ktfmt", "ktlint" },
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "kotlin" },
    },
  },
}

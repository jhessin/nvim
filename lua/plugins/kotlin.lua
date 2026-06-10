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
            -- If fname is not a string, fall back to cwd
            if type(fname) ~= "string" then
              return vim.fn.getcwd()
            end

            -- Normalize fname into a real path
            fname = vim.fs.normalize(fname)

            -- Search upward for any valid Kotlin project root marker
            local root = vim.fs.find({
              "settings.gradle.kts",
              "settings.gradle",
              "build.gradle.kts",
              "build.gradle",
              ".git",
              "gradlew",
            }, { upward = true, path = fname })[1]

            -- Always return a string
            return root and vim.fs.dirname(root) or vim.fn.getcwd()
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

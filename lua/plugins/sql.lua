return {
  {
    "mason-org/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "sqlls",
      })
    end,
  },

  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        sqlls = {
          cmd = { "sql-language-server", "up", "--method", "stdio" },
          filetypes = { "sql", "mysql" },
          root_dir = function(fname)
            return require("lspconfig.util").root_pattern(".git", ".sqllsrc.json")(fname) or vim.loop.os_homedir()
          end,
        },
      },
    },
  },
}

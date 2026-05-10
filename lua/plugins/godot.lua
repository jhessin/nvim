return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gdscript = {
          force_setup = true,
          single_file_support = false,
          cmd = { "ncat", "localhost", "6005" },
          root_dir = require("lspconfig.util").root_pattern("project.godot", ".git"),
          filetypes = { "gd", "gdscript", "gdscript3" },
        },
      },
    },
  },
  { "habamax/vim-godot" },
  { "skywind3000/asyncrun.vim" },
  { "teatek/gdscript-extended-lsp.nvim", opts = { view_type = "floating", picker = "snacks" } },
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            hidden = true, -- show hidden files
            ignored = false, -- don't show gitignored files
            exclude = { -- exclude specific patterns
              "*.uid", -- glob pattern for files ending with .uid
              "server.pipe", -- exact filename match
            },
          },
        },
      },
    },
  },
}

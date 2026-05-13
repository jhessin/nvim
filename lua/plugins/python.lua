return {
  -- Enable Python LSP
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          -- cmd = { "ncat", "localhost", "6005" },
        },
      },
    },
  },
  -- Python-specific extras
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = { "python" },
    },
  },

  -- Optional: python virtualenv support
  -- {
  --
  -- }
}

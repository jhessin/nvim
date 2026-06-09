return {
  "folke/noice.nvim",
  opts = {
    presets = {
      command_palette = false,
      long_message_to_split = false,
      inc_rename = false,
      lsp_doc_border = false,
    },
    lsp = {
      progress = { enabled = false },
      hover = { enabled = false },
      signature = { enabled = false },
    },
    messages = { enabled = false },
    notify = { enabled = false },
  },
}

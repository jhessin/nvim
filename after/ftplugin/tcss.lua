-- Comment style: Textual CSS uses // comments
vim.opt_local.commentstring = "/* %s */"

-- Disable any indent plugin Neovim tries to load for unknown filetypes
vim.opt_local.indentexpr = ""
vim.opt_local.autoindent = true
vim.opt_local.smartindent = false

-- Use your brace‑based indentation rules
vim.opt_local.cindent = true

-- Tabs/spaces: match your formatter (2 spaces)
vim.opt_local.shiftwidth = 2
vim.opt_local.tabstop = 2
vim.opt_local.expandtab = true

-- Folding: simple brace‑based folding
-- vim.opt_local.foldmethod = "expr"
-- vim.opt_local.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt_local.foldmethod = "marker"
vim.opt_local.foldmarker = "{,}"

-- Use css treesitter parser
vim.treesitter.language.register("css", "tcss")

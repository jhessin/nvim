return {
  -- { "joshdick/onedark.vim" },
  -- { "flazz/vim-colorschemes" },
  -- ~/.config/nvim/lua/plugins/kanagawa-dragon.lua
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      theme = "dragon",
      -- compile = true,
      transparent = false,
      dimInactive = false,

      colors = {
        theme = {
          dragon = {
            ui = {
              bg_gutter = "none",
              bg = "#0d0d0f", -- deeper black
              bg_p1 = "#16161a", -- stronger cursorline
              bg_p2 = "#1c1c20", -- stronger visual selection
            },
          },
        },
      },

      overrides = function(colors)
        local theme = colors.theme
        return {

          -- Cursor pops off the screen
          Cursor = { reverse = true },

          -- High‑contrast search
          Search = { bg = theme.syn.accent, fg = theme.ui.bg, bold = true },
          IncSearch = { bg = theme.syn.accent, fg = theme.ui.bg, bold = true },

          -- Stronger visual selection
          Visual = { bg = theme.ui.bg_p2 },

          -- Sharper splits and borders
          WinSeparator = { fg = theme.ui.fg_dim, bold = true },
          FloatBorder = { fg = theme.ui.fg_dim, bg = theme.ui.bg },

          -- Telescope clarity
          TelescopeBorder = { fg = theme.ui.fg_dim, bg = theme.ui.bg },
          TelescopePromptBorder = { fg = theme.ui.fg_dim, bg = theme.ui.bg },
          TelescopeResultsBorder = { fg = theme.ui.fg_dim, bg = theme.ui.bg },
          TelescopePreviewBorder = { fg = theme.ui.fg_dim, bg = theme.ui.bg },

          -- High‑contrast diagnostics
          DiagnosticError = { fg = theme.diag.error, bold = true },
          DiagnosticWarn = { fg = theme.diag.warning, bold = true },
          DiagnosticInfo = { fg = theme.diag.info, bold = true },
          DiagnosticHint = { fg = theme.diag.hint, bold = true },

          DiagnosticUnderlineError = { sp = theme.diag.error, undercurl = true },
          DiagnosticUnderlineWarn = { sp = theme.diag.warning, undercurl = true },
          DiagnosticUnderlineInfo = { sp = theme.diag.info, undercurl = true },
          DiagnosticUnderlineHint = { sp = theme.diag.hint, undercurl = true },

          -- Sharper syntax contrast
          ["@keyword"] = { fg = theme.syn.special1, bold = true },
          ["@function"] = { fg = theme.syn.fun, bold = true },
          ["@variable"] = { fg = theme.syn.variable },
          ["@constant"] = { fg = theme.syn.constant, bold = true },

          -- High‑contrast cursorline
          CursorLine = {
            bg = theme.ui.bg_p3, -- brighter than folds
            underline = true, -- bottom border
            overline = true,
          },
          CursorLineNr = { fg = theme.syn.accent, bold = true },

          -- Tone down folds so they don't compete with cursorline
          -- Folded = {
          --   bg = theme.ui.bg, -- same as normal background
          --   fg = theme.ui.fg_dim, -- faint text
          --   italic = true,
          -- },
          --
          -- FoldColumn = {
          --   bg = theme.ui.bg,
          --   fg = theme.ui.fg_dim,
          -- },
        }
      end,
    },
    config = function(_, opts)
      require("kanagawa").setup(opts)

      -- vim.cmd("KanagawaCompile")
      vim.cmd("colorscheme kanagawa-dragon")
    end,
  },

  -- -- Configure LazyVim to load your preferred theme
  -- {
  --   "LazyVim/LazyVim",
  --   opts = {
  --     colorscheme = "kanagawa-dragon",
  --   },
  -- },
}

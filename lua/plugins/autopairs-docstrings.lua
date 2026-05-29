return {
  "windwp/nvim-autopairs",
  opts = function(_, opts)
    local Rule = require("nvim-autopairs.rule")

    opts.rules = opts.rules or {}

    vim.list_extend(opts.rules, {
      Rule('"""', '"""', "python"),
    })
  end,
}

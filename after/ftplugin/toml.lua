-- Fold on TOML table headers like [table] or [[array.table]]
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.TomlFoldExpr()"
vim.opt.foldenable = true
vim.opt.foldlevel = 99

-- Custom TOML foldexpr
function TomlFoldExpr()
  local line = vim.fn.getline(vim.v.lnum)

  -- Start a fold at any table header
  if line:match("^%s*%[.+%]%s*$") then
    return ">1"
  end

  -- End fold when next table starts
  if line:match("^%s*%[.+%]%s*$") then
    return "<1"
  end

  return "="
end

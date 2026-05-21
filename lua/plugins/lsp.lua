return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          before_init = function(_, config)
            config.settings.python.analysis.dummyVariableNames = { "_", "__", "___" }
            -- config.settings.pyright = {
            --   disableTaggedHints = true,
            -- }
            -- Check if Neovim successfully detected a project root directory
            if config.root_dir then
              -- Dynamically append the py4godot location relative to your project root
              local py4godot_root = config.root_dir .. "/addons/py4godot"
              local interpreter = py4godot_root .. "/cpython-3.14.3-windows64/python/python.exe"

              -- Verify the file exists at this dynamic location before applying it
              if vim.fn.filereadable(interpreter) == 1 then
                config.settings.python.pythonPath = interpreter
                config.settings.python.analysis.extraPaths = { py4godot_root }
              end
            end
          end,
          handlers = {
            ["textDocument/publishDiagnostics"] = function(err, result, ctx)
              -- Modern signature accepts exactly 3 arguments (err, result, ctx)
              if err then
                return
              end

              local filtered = {}
              for _, diagnostic in ipairs(result.diagnostics) do
                -- Continues filtering out '"_variable" is not accessed'
                if not (diagnostic.message:find('"%_.-" is not accessed')) then
                  table.insert(filtered, diagnostic)
                end
              end
              result.diagnostics = filtered

              -- Use the modern, standardized Neovim LSP handler fallback
              vim.lsp.handlers["textDocument/publishDiagnostics"](err, result, ctx)
            end,
          },
        },
      },
    },
  },
}

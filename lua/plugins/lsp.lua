return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {
          before_init = function(_, config)
            config.settings.python.analysis.dummyVariableNames = { "_", "__", "___" }
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
        },
      },
    },
  },
}

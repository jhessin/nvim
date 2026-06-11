return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "skywind3000/asynctasks.vim" },

  config = function()
    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local conf = require("telescope.config").values
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")

    function FuzzyPickAsyncTask()
      local raw = vim.fn["asynctasks#source"]("all") or {}
      local tasks = {}

      for _, item in ipairs(raw) do
        -- If item is a table, extract the first element
        if type(item) == "table" then
          table.insert(tasks, item[1])
        else
          table.insert(tasks, item)
        end
      end

      pickers
        .new({}, {
          prompt_title = "AsyncTasks",
          finder = finders.new_table({
            results = tasks,
          }),
          sorter = conf.generic_sorter({}),
          attach_mappings = function(prompt_bufnr, _)
            actions.select_default:replace(function()
              actions.close(prompt_bufnr)
              local selection = action_state.get_selected_entry()
              if selection and selection[1] then
                vim.cmd("AsyncTask " .. selection[1])
              end
            end)
            return true
          end,
        })
        :find()
    end

    vim.keymap.set("n", "<localleader>,", FuzzyPickAsyncTask, { desc = "Fuzzy pick AsyncTask" })
  end,
}

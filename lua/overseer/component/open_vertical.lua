--@type overseer.ComponentFileDefinition
return {
  desc = "Opens a terminal when a task starts",
  constructor = function()
    return {
      on_start = function(_, task)
        -- task:open_output("vertical")
        task:add_component({
          "open",
          direction = "vertical",
          focus = false,
          enter = false,
          reuse = "shared",
        })
      end,
    }
  end,
}

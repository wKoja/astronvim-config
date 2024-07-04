---@type LazySpec
return {
  {
    "nvim-telescope/telescope.nvim",
    opts = function(_, opts)
      local actions = require "telescope.actions"
      opts.defaults.mappings.i["<TAB>"] = actions.move_selection_next
      opts.defaults.mappings.i["<S-TAB>"] = actions.move_selection_previous
    end,
  }
}

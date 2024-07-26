---@type LazySpec
return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = function(_, opts)
    opts.window = {
      position = "float",
    }
    opts.buffers = {
      follow_current_file = {
        enabled = true
      }
    }
  end,
}

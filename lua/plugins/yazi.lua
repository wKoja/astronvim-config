---@type LazySpec
return {
  "mikavilpas/yazi.nvim",
  opts = function(_, opts)
    opts.keymaps = {
      open_file_in_horizontal_split = "<c-h>",
    }
  end,
}

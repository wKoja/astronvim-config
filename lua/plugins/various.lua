---@type LazySpec
return {
  {
    "theHamsta/nvim-dap-virtual-text",
    opts = function(_, opts) opts.virt_text_pos = "eol" end,
  },
}

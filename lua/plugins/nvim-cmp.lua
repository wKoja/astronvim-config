-- Customize nvim-cmp

---@type LazySpec
return { -- override nvim-cmp plugin
  "hrsh7th/nvim-cmp",
  -- override the options table that is used in the `require("cmp").setup()` call
  opts = function(_, opts) table.insert(opts.sources, { name = "codeium", priority = 1000 }) end,
}

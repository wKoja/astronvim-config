-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, config)
    local none_ls = require "null-ls"
    config.sources = {
      none_ls.builtins.formatting.prettierd,
    }
    return config -- return final config table
  end,
}

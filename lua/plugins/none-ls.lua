-- Customize None-ls sources

---@type LazySpec
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, config)
    local none_ls = require "null-ls"
    config.sources = {
      none_ls.builtins.formatting.prettierd,
      none_ls.builtins.formatting.clang_format.with {
        extra_args = {
          "-style=",
          '"{IndentWidth: 2}"',
        },
      },
    }
    return config -- return final config table
  end,
}

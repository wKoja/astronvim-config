-- Customize Mason plugins

---@type LazySpec
return {
  {
    "williamboman/mason.nvim",
    opts = {
      pip = {
        upgrade_pip = false,
      },
    },
  },
}

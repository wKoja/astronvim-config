-- Customize Mason plugins

---@type LazySpec
return {
  {
    "mason-org/mason.nvim",
    opts = {
      pip = {
        upgrade_pip = false,
      },
    },
  },
}

-- Customize Mason plugins

---@type LazySpec
return {
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    -- overrides `require("mason-null-ls").setup(...)`
    -- add more things to the ensure_installed table protecting against community packs modifying it
    opts = {
      ensure_installed = {

        -- lsp
        "lua-language-server",
        -- null-ls
        "prettier",
        "stylua",
        -- dap
        "debugpy",
      },
    },
  },
}

-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  -- TODO: Remove branch v4 on release
  { "AstroNvim/astrocommunity", branch = "v4" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.svelte" },
  { import = "astrocommunity.pack.prisma" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.bash" },
  -- { import = "astrocommunity.bars-and-lines.heirline-mode-text-statusline" },
  { import = "astrocommunity.code-runner.sniprun" },
  { import = "astrocommunity.debugging.nvim-dap-virtual-text" },
  { import = "astrocommunity.git.git-blame-nvim" },
  -- import/override with your plugins folder
}

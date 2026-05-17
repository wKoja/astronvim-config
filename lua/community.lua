-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.
---@type LazySpec
return {
  { "AstroNvim/astrocommunity" },
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  { import = "astrocommunity.colorscheme.everforest" },
  { import = "astrocommunity.colorscheme.nordic-nvim" },
  { import = "astrocommunity.color.transparent-nvim" },
  { import = "astrocommunity.pack.typescript" },
  -- { import = "astrocommunity.pack.svelte" },
  -- { import = "astrocommunity.pack.prisma" },
  { import = "astrocommunity.pack.tailwindcss" },
  { import = "astrocommunity.pack.lua" },
  -- { import = "astrocommunity.pack.java" },
  -- { import = "astrocommunity.pack.elixir-phoenix" },
  -- { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.python.base" },
  { import = "astrocommunity.pack.python.basedpyright" },
  { import = "astrocommunity.pack.python.isort" },
  { import = "astrocommunity.pack.python.black" },
  { import = "astrocommunity.pack.python.ruff" },
  { import = "astrocommunity.pack.bash" },
  -- { import = "astrocommunity.bars-and-lines.heirline-mode-text-statusline" },
  { import = "astrocommunity.debugging.nvim-dap-virtual-text" },
  -- import/override with your plugins folder
  { import = "astrocommunity.file-explorer.yazi-nvim" },
  { import = "astrocommunity.file-explorer.fyler-nvim" },
}

-- Nordic with bright borders and light cursorline/visual for better visibility
local helpers = require("helpers.nordic")
require("nordic").setup({
  bright_border = true,
  cursorline = { theme = "light", bold = true },
  visual = { theme = "light" },
  on_highlight = helpers.on_highlight,
})
require("nordic").load()

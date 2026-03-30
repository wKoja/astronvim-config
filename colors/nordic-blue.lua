-- Nordic with full blue-tinted foreground and bright borders
local helpers = require("helpers.nordic")
require("nordic").setup({
  bright_border = true,
  reduced_blue = false,
  cursorline = { theme = "light", bold = true },
  visual = { theme = "light" },
  on_highlight = helpers.on_highlight,
})
require("nordic").load()

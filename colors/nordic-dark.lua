-- Nordic with default dark cursorline/visual but visible borders
local helpers = require("helpers.nordic")
require("nordic").setup({
  bright_border = true,
  cursorline = { theme = "dark" },
  visual = { theme = "dark" },
  on_highlight = helpers.on_highlight,
})
require("nordic").load()

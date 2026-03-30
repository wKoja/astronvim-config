local M = {}

--- Shared telescope highlight overrides for all nordic variants.
--- Uses gray2 for selection bg to ensure visibility in flat-style telescope.
function M.on_highlight(highlights, palette)
  highlights.TelescopeSelection = {
    bg = palette.gray2,
    fg = palette.yellow.bright,
    bold = true,
  }
  highlights.TelescopeSelectionCaret = {
    bg = palette.gray2,
    fg = palette.yellow.bright,
    bold = true,
  }
end

return M

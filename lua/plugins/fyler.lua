---@type LazySpec
return {
  "A7Lavinraj/fyler.nvim",
  opts = function(_, opts)
    opts.views = opts.views or {}
    opts.views.finder = opts.views.finder or {}
    opts.views.finder.close_on_select = false
    opts.views.finder.win = vim.tbl_deep_extend("force", opts.views.finder.win or {}, {
      kind = "split_left_most",
      kinds = {
        split_left = {
          width = 25,
        },
      },
    })
  end,
  init = function()
    local min_width, max_width, padding = 20, 80, 2
    local group = vim.api.nvim_create_augroup("FylerAutoResize", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      group = group,
      pattern = "fyler",
      callback = function(args)
        local function resize()
          local lines = vim.api.nvim_buf_get_lines(args.buf, 0, -1, false)
          local longest = 0
          for _, line in ipairs(lines) do
            local w = vim.fn.strdisplaywidth(line)
            if w > longest then longest = w end
          end
          local width = math.max(min_width, math.min(max_width, longest + padding))
          for _, winid in ipairs(vim.fn.win_findbuf(args.buf)) do
            if vim.api.nvim_win_is_valid(winid) then pcall(vim.api.nvim_win_set_width, winid, width) end
          end
        end
        vim.api.nvim_create_autocmd({ "BufEnter", "TextChanged", "TextChangedI" }, {
          group = group,
          buffer = args.buf,
          callback = vim.schedule_wrap(resize),
        })
        vim.schedule(resize)
      end,
    })
  end,
}

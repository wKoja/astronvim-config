---@type LazySpec
return {
  "nvim-telescope/telescope.nvim",
  opts = function(_, opts)
    -- The astrocommunity pack loads the file_browser extension inside its `opts`
    -- function, which caches the extension config *before* telescope.setup runs.
    -- That means extension-level (`extensions.file_browser`) overrides never reach
    -- the picker. Setting these on `defaults` works because the picker reads them
    -- live from telescope.config at creation time (see telescope/pickers.lua).
    --
    -- Telescope is only used for file_browser in this AstroNvim v6 config (snacks
    -- handles the other pickers), so changing the defaults is safe here.
    opts.defaults = opts.defaults or {}

    -- show results from the top down instead of growing up from the prompt
    opts.defaults.sorting_strategy = "ascending"
    opts.defaults.layout_config = vim.tbl_deep_extend("force", opts.defaults.layout_config or {}, {
      prompt_position = "top",
    })

    -- Image previews via snacks.nvim -- the same fast renderer AstroNvim's own
    -- (snacks) picker uses. We wrap the default buffer_previewer_maker: image files
    -- are drawn with Snacks.image (which cleans the previous placement first, so
    -- nothing stacks), everything else falls back to telescope's normal previewer.
    -- This is read live from config.values, so it reaches the file_browser picker
    -- too (its `cat` previewer calls conf.buffer_previewer_maker).
    local default_maker = require("telescope.previewers").buffer_previewer_maker
    opts.defaults.buffer_previewer_maker = function(filepath, bufnr, o)
      local ok, image = pcall(require, "snacks.image")
      if ok and image.supports_file and image.supports_file(filepath) then
        require("snacks.image.buf").attach(bufnr, { src = filepath })
        return
      end
      default_maker(filepath, bufnr, o)
    end
  end,
}

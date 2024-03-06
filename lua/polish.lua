-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
--
local autocmd = vim.api.nvim_create_autocmd

autocmd("BufEnter", {
  command = "silent! set autoindent smartindent",
})

autocmd("filetype", {
  command = [[setlocal formatoptions-=c formatoptions-=r formatoptions-=o]],
})

-- Mapping data with "desc" stored directly by vim.keymap.set().
--
-- Please use this mappings table to set keyboard mapping since this is the
-- lower level configuration and more robust one. (which-key will
-- automatically pick-up stored data by this setting.)
return {
  i = {
    -- navigate within insert mode
    ["<C-h>"] = { "<Left>", desc = "Move left" },
    ["<C-l>"] = { "<Right>", desc = "Move right" },
    ["<C-j>"] = { "<Down>", desc = "Move down" },
    ["<C-k>"] = { "<Up>", desc = "Move up" },
  },

  n = {
    -- buffer
    L = {
      function() require("astronvim.utils.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
      desc = " Next buffer",
    },
    H = {
      function() require("astronvim.utils.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
      desc = " Previous buffer",
    },

    ["<leader>x"] = { function() require("astronvim.utils.buffer").close() end, desc = "Close buffer" },

    -- motions
    ["<C-d>"] = { "<C-d>zz", desc = "Half-page down and centers the cursor" },
    ["<C-u>"] = { "<C-u>zz", desc = "Half-page up and centers the cursor" },

    -- tmux navigation
    ["<C-h>"] = { "<cmd>TmuxNavigateLeft<CR>", desc = "Window left" },
    ["<C-l>"] = { "<cmd>TmuxNavigateRight<CR>", desc = "Window right" },
    ["<C-j>"] = { "<cmd>TmuxNavigateDown<CR>", desc = "Window down" },
    ["<C-k>"] = { "<cmd>TmuxNavigateUp<CR>", desc = "Window up" },

    -- ufo
    ["zR"] = {
      function() require("ufo").openAllFolds() end,
    },
    ["zM"] = {
      function() require("ufo").closeAllFolds() end,
    },

    ["<C-w>b"] = { ":Bdelete other<CR>", desc = "Close other buffers" },

    -- comment line
    ["<C-_>"] = {
      function() require("Comment.api").toggle.linewise.current() end,

      desc = " toggle comment",
    },

    -- neotree
    ["<C-n>"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle explorer" },
    ["<leader>e"] = {
      function()
        if vim.bo.filetype == "neo-tree" then
          vim.cmd.wincmd "p"
        else
          vim.cmd.Neotree "focus"
        end
      end,
      desc = "Toggle Explorer Focus",
    },

    -- terminal
    ["<A-h>"] = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "ToggleTerm horizontal split" },
    ["<A-i>"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "ToggleTerm float" },

    -- disabled
    ["<C-s>"] = false,
    ["<C-c>"] = false,
    ["<tab>"] = false,
    ["<S-tab>"] = false,
    ["<S-j>"] = false,
    ["<S-k>"] = false,
    ["<leader>ch"] = false,
    ["<leader>/"] = false,
  },
  v = {

    -- comment
    ["<C-_>"] = {
      "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
      desc = " toggle comment",
    },
    -- disabled
    ["<leader>/"] = false,
  },
  t = {
    ["<C-x>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), desc = "Escape terminal mode" },
  },
}

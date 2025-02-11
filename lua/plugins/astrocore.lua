-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!
-- Configuration documentation can be found with `:h astrocore`
-- NOTE: We highly recommend setting up the Lua Language Server (`:LspInstall lua_ls`)
--       as this provides autocomplete and documentation while editing

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    -- Configure core features of AstroNvim
    features = {
      large_buf = { size = 1024 * 500, lines = 10000 }, -- set global limits for large files for disabling features like treesitter
      autopairs = true, -- enable autopairs at start
      cmp = true, -- enable completion at start
      highlighturl = true, -- highlight URLs at start
      notifications = true, -- enable notifications at start
    },
    -- Diagnostics configuration (for vim.diagnostics.config({...})) when diagnostics are on
    diagnostics = {
      virtual_text = false,
      underline = true,
    },
    -- vim options can be configured here
    options = {
      opt = { -- vim.opt.<key>
        relativenumber = true, -- sets vim.opt.relativenumber
        number = true, -- sets vim.opt.number
        spell = false, -- sets vim.opt.spell
        signcolumn = "auto", -- sets vim.opt.signcolumn to auto
        wrap = false, -- sets vim.opt.wrap
      },
      g = { -- vim.g.<key>
        -- configure global vim variables (vim.g)
        -- NOTE: `mapleader` and `maplocalleader` must be set in the AstroNvim opts or before `lazy.setup`
        -- This can be found in the `lua/lazy_setup.lua` file
      },
      o = {
        scrolloff = 999,
      },
      env = {
        OPENAI_API_HOST = "api.openai.com",
      },
    },
    -- Mappings can be configured through AstroCore as well.
    -- NOTE: keycodes follow the casing in the vimdocs. For example, `<Leader>` must be capitalized
    mappings = {
      -- first key is the mode
      i = {

        -- navigate within insert mode
        ["<C-h>"] = { "<Left>", desc = "Move left" },
        ["<C-l>"] = { "<Right>", desc = "Move right" },
        ["<C-j>"] = { "<Down>", desc = "Move down" },
        ["<C-k>"] = { "<Up>", desc = "Move up" },
      },
      n = {
        -- second key is the lefthand side of the map

        -- navigate buffer tabs with `H` and `L`
        L = {
          function() require("astrocore.buffer").nav(vim.v.count > 0 and vim.v.count or 1) end,
          desc = "Next buffer",
        },
        H = {
          function() require("astrocore.buffer").nav(-(vim.v.count > 0 and vim.v.count or 1)) end,
          desc = "Previous buffer",
        },

        -- mappings seen under group name "Buffer"
        ["<Leader>bD"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Pick to close",
        },
        -- tables with just a `desc` key will be registered with which-key if it's installed
        -- this is useful for naming menus
        ["<Leader>b"] = { desc = "Buffers" },
        -- quick save
        -- ["<C-s>"] = { ":w!<cr>", desc = "Save File" },  -- change description but the same command

        ["<Leader>x"] = { function() require("astrocore.buffer").close() end, desc = "Close buffer" },

        -- motions
        ["<C-d>"] = { "<C-d>zz", desc = "Half-page down and centers the cursor" },
        ["<C-u>"] = { "<C-u>zz", desc = "Half-page up and centers the cursor" },

        -- tmux navigation
        ["<C-h>"] = { "<cmd>TmuxNavigateLeft<CR>", desc = "Window left" },
        ["<C-l>"] = { "<cmd>TmuxNavigateRight<CR>", desc = "Window right" },
        ["<C-j>"] = { "<cmd>TmuxNavigateDown<CR>", desc = "Window down" },
        ["<C-k>"] = { "<cmd>TmuxNavigateUp<CR>", desc = "Window up" },

        -- LLM tools
        ["<Leader>aa"] = {"<cmd>CodeCompanionChat<CR>", desc = "CodeCompanionChat"},
        ["<Leader>ac"] = {"<cmd>CodeCompanionActions<CR>", desc = "CodeCompanionActions"},

        -- ufo
        ["zR"] = {
          function() require("ufo").openAllFolds() end,
        },
        ["zM"] = {
          function() require("ufo").closeAllFolds() end,
        },

        ["<C-w>b"] = { ":Bdelete other<CR><CR>", desc = "Close other buffers" },

        -- comment line
        ["<C-_>"] = {
          function() require("Comment.api").toggle.linewise.current() end,

          desc = " toggle comment",
        },

        -- neotree
        -- ["<C-n>"] = { "<cmd>Neotree toggle<cr>", desc = "Toggle explorer" },
        ["<Leader>e"] = {
          function()
            if vim.bo.filetype == "neo-tree" then
              vim.cmd.Neotree "toggle"
            else
              vim.cmd.Neotree "reveal"
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
        ["<Leader>ch"] = false,
        ["<Leader>/"] = false,

        --dap
        ["<Leader>rt"] = { function() require("neotest").run.run() end, desc = "Run test" },
        ["<Leader>rd"] = { function() require("neotest").run.run({strategy = "dap"}) end, desc = "Debug test" },
        ["<Leader>rT"] = { function() require("neotest").run.run(vim.fn.expand("%")) end, desc = "Run all tests in the file" },
        ["<F2>"] = { function() require("dap").terminate() end, desc = "Terminate DAP session" },
        ["<F3>"] = { function() require("osv").launch { port = 8086 } end, desc = "Launch lua debug server" },
        ["<F11>"] = { function() require("dapui").toggle() end, desc = "Toggle DAP UI" },
        ["<F12>"] = { function() require("dap.ui.widgets").hover() end, desc = "Hovering" },
        ["<F4>"] = { function() require("dap").toggle_breakpoint() end, desc = "Toggle breakpoint" },
        ["<F5>"] = { function() require("dap").continue() end, desc = "DAP continue execution" },
        ["<S-F7>"] = { function() require("dap").step_into() end, desc = "DAP step into" },
        ["<F8>"] = { function() require("dap").step_over() end, desc = "DAP step over" },
        ["<F9>"] = { function() require("dap").step_out() end, desc = "DAP step out" },
      },
      v = {

        ["<Leader>sc"] = { "<cmd>Silicon<cr>", desc = "Silicon Print" },

        -- comment
        ["<C-_>"] = {
          "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
          desc = " toggle comment",
        },
        -- disabled
        ["<Leader>/"] = false,
      },
      t = {
        ["<C-x>"] = { vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true), desc = "Escape terminal mode" },

        -- terminal
        ["<A-h>"] = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "ToggleTerm horizontal split" },
        ["<A-i>"] = { "<cmd>ToggleTerm direction=float<cr>", desc = "ToggleTerm float" },
      },
    },
  },
}

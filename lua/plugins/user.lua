-- You can also add or configure plugins by creating files in this `plugins/` folder
-- Here are some examples:

---@type LazySpec
return {

  -- == Examples of Adding Plugins ==

  "andweeb/presence.nvim",
  {
    "ray-x/lsp_signature.nvim",
    event = "BufRead",
    config = function() require("lsp_signature").setup() end,
  },

  -- == Examples of Overriding Plugins ==

  -- You can also easily customize additional setup of plugins that is outside of the plugin's setup call
  {
    "L3MON4D3/LuaSnip",
    config = function(plugin, opts)
      require "astronvim.plugins.configs.luasnip"(plugin, opts) -- include the default astronvim config that calls the setup call
      -- add more custom luasnip configuration such as filetype extend or custom snippets
      local luasnip = require "luasnip"
      luasnip.filetype_extend("javascript", { "javascriptreact" })
    end,
  },

  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-neotest/nvim-nio",
      "nvim-neotest/neotest-python",
      "nvim-lua/plenary.nvim",
      "antoinemadec/FixCursorHold.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("neotest").setup {
        adapters = {
          require "neotest-python" {
            dap = { justMyCode = false },
            is_test_file = function(file_path) return file_path:match "test" end,
          },
        },
      }
    end,
  },

  {
    "tpope/vim-surround",
    lazy = false,
  },

  {
    "tpope/vim-fugitive",
    lazy = false,
  },

  {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      }
    end,
    lazy = false,
  },

  {
    "Pocco81/auto-save.nvim",
    lazy = false,
  },

  {
    "Asheq/close-buffers.vim",
    lazy = false,
  },

  -- lazy stuff

  { "nvim-pack/nvim-spectre" },

  {
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    config = function()
      require("silicon").setup {
        -- Configuration here, or leave empty to use defaults
        font = "JetBrainsMono Nerd Font Mono=34;Noto Color Emoji=34",
        theme = "Dracula",
        background = "#1E1E2E",
        to_clipboard = true,
      }
    end,
  },

  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("codecompanion").setup {
        adapters = {
          xai = function()
            return require("codecompanion.adapters").extend("xai", {
              env = {
                api_key = "cmd:cat /home/koja/.config/nvim/extra/grok",
              },
              schema = {
                model = {
                  default = "grok-4-0709",
                },
              },
            })
          end,
        },
        strategies = {
          chat = {
            adapter = "xai",
          },
          inline = {
            adapter = "xai",
          },
        },
      }
    end,
  },
}

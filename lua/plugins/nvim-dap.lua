---@type LazySpec
return {
  "jay-babu/mason-nvim-dap.nvim",
  opts = {
    automatic_setup = true,
    handlers = {
      python = function(source_name)
        local dap = require "dap"
        -- not working properly
        dap.configurations.python = {
          {
            name = "Debug: Flask app",
            type = "python",
            request = "launch",
            module = "debugpy",
            args = {
              "-m",
              "flask",
              "--app",
              "grafiniti_api",
              "run",
              "--port",
              "8080",
              "--debug",
              "--reload",
            },
            justMyCode = false,
            cwd = "${workspaceFolder}",
          },
          {
            name = "Debug: Pytest",
            type = "python",
            request = "launch",
            module = "debugpy",
            justMyCode = true,
            args = {
              "-m",
              "pytest",
              "${file}",
            },
          },
        }
      end,
    },
  },
}

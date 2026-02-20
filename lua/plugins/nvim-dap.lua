---@type LazySpec
return {
  "jay-babu/mason-nvim-dap.nvim",
  opts = {
    automatic_setup = true,
    handlers = {
      python = function(source_name)
        local dap = require "dap"
        dap.adapters.python = {
          type = "executable",
          command = "debugpy-adapter",
        }
        dap.configurations.python = {
          {
            name = "Debug: Current file",
            type = "python",
            request = "launch",
            program = "${file}",
            justMyCode = true,
            cwd = "${workspaceFolder}",
          },
          {
            name = "Debug: Flask",
            type = "python",
            request = "launch",
            module = "flask",
            justMyCode = true,
            cwd = "${workspaceFolder}",
            args = function()
              local app = vim.fn.input("Flask app module [app]: ", "app")
              local port = vim.fn.input("Port [5000]: ", "5000")
              return { "--app", app, "run", "--port", port, "--debug" }
            end,
          },
          {
            name = "Debug: FastAPI",
            type = "python",
            request = "launch",
            module = "uvicorn",
            justMyCode = true,
            cwd = "${workspaceFolder}",
            args = function()
              local app = vim.fn.input("FastAPI app [main:app]: ", "main:app")
              local port = vim.fn.input("Port [8000]: ", "8000")
              return { app, "--port", port, "--reload" }
            end,
          },
          {
            name = "Debug: Streamlit",
            type = "python",
            request = "launch",
            module = "streamlit",
            justMyCode = true,
            cwd = "${workspaceFolder}",
            args = function()
              local file = vim.fn.input("Streamlit file [app.py]: ", "app.py")
              return { "run", file }
            end,
          },
          {
            name = "Debug: Pytest (current file)",
            type = "python",
            request = "launch",
            module = "pytest",
            justMyCode = true,
            cwd = "${workspaceFolder}",
            args = { "${file}", "-sv" },
          },
          {
            name = "Debug: Pytest (all)",
            type = "python",
            request = "launch",
            module = "pytest",
            justMyCode = true,
            cwd = "${workspaceFolder}",
            args = { "-sv" },
          },
          {
            name = "Debug: Attach (remote)",
            type = "python",
            request = "attach",
            connect = function()
              local host = vim.fn.input("Host [127.0.0.1]: ", "127.0.0.1")
              local port = vim.fn.input("Port [5678]: ", "5678")
              return { host = host, port = tonumber(port) }
            end,
          },
        }
      end,
      java = function(source_name)
        local dap = require "dap"
        dap.configurations.java = {
          {
            type = "java",
            request = "attach",
            name = "Attach to Quarkus",
            hostName = "127.0.0.1",
            port = 5005,
          },
        }
      end,
    },
  },
}

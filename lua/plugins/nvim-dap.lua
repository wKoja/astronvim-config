---@type LazySpec
return {
  "jay-babu/mason-nvim-dap.nvim",
  opts = {
    automatic_setup = true,
    handlers = {
      python = function(_)
        local dap = require "dap"
        dap.adapters.python = {
          type = "executable",
          command = "debugpy-adapter",
        }
        dap.configurations.python = {
          {
            name = "Debug: Flask",
            type = "python",
            request = "launch",
            module = "flask",
            justMyCode = true,
            cwd = "${workspaceFolder}",
            args = function()
              local app = "grafiniti_api"
              local port = "8080"
              return { "--app", app, "run", "--port", port, "--debug" }
            end,
          },
          {
            name = "Debug: Current file",
            type = "python",
            request = "launch",
            program = "${file}",
            justMyCode = true,
            cwd = "${workspaceFolder}",
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
    },
  },
  config = function(_, opts)
    require("mason-nvim-dap").setup(opts)
    local dap = require "dap"
    dap.configurations.java = {
      {
        type = "java",
        request = "launch",
        name = "Launch: Current file",
        mainClass = "${file}",
      },
      {
        type = "java",
        request = "launch",
        name = "Launch: Main class",
        mainClass = function() return vim.fn.input("Main class: ", "") end,
      },
      {
        type = "java",
        request = "attach",
        name = "Attach to Quarkus (port 5005)",
        hostName = "127.0.0.1",
        port = 5005,
      },
      {
        type = "java",
        request = "attach",
        name = "Attach to Javalin (port 5005)",
        hostName = "127.0.0.1",
        port = 5005,
      },
      {
        type = "java",
        request = "attach",
        name = "Attach to JVM (custom port)",
        hostName = "127.0.0.1",
        port = function() return tonumber(vim.fn.input("Debug port [5005]: ", "5005")) end,
      },
    }
  end,
}

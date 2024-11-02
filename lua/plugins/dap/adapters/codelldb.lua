local dap = require("dap")

dap.adapters.codelldb = {
  type = "server",
  port = "${port}",
  executable = {
    command = vim.fn.exepath("codelldb"),
    args = { "--port", "${port}" },
  },
}

local configurations = {
  {
    name = "LLDB: Launch (justMyCode = false)",
    type = "codelldb",
    request = "launch",
    program = function()
      local path = vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      -- to go back to normal mode, otherwise vim.fn.input leaves you in insert mode
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
      return path
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
    console = "integratedTerminal",
    justMyCode = false,
  },
  {
    name = "LLDB: Launch",
    type = "codelldb",
    request = "launch",
    program = function()
      local path = vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      -- to go back to normal mode, otherwise vim.fn.input leaves you in insert mode
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Esc>", true, false, true), "n", true)
      return path
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
    console = "integratedTerminal",
  },
}

dap.configurations.c = configurations
dap.configurations.cpp = configurations
dap.configurations.rust = configurations

local M = {}

------------ SETUP --------------
M.setup = function (_, opts)
  local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
  require("dap-python").setup(path)

  local dap = require('dap')
  local configs = dap.configurations.python

  dap.configurations.python = configs
  table.insert(configs, 1, {
    type = 'python';
    request = 'launch';
    name = 'Launch file (justMyCode = false)';
    program = '${file}';
    console = 'integratedTerminal';
    justMyCode = false;
  })
  table.insert(configs, 2, {
    type = 'python';
    request = 'launch';
    name = 'Launch file with arguments (justMyCode = false)';
    program = '${file}';
    args = function()
      local args_string = vim.fn.input('Arguments: ')
      return vim.split(args_string, " +")
    end;
    console = 'integratedTerminal';
    justMyCode = false;
  })
end

return M

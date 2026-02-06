------------ CONFIG --------------
local _config = function(_, opts)
  local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
  require("dap-python").setup(path)

  local dap = require("dap")
  local configs = dap.configurations.python

  dap.configurations.python = configs
  table.insert(configs, 1, {
    type = "python",
    request = "launch",
    name = "Launch file (justMyCode = false, cwd = ${workspaceFolder})",
    program = "${file}",
    console = "integratedTerminal",
    justMyCode = false,
    cwd = "${workspaceFolder}",
  })
  table.insert(configs, 2, {
    type = "python",
    request = "launch",
    name = "Launch file with arguments (justMyCode = false, cwd = ${workspaceFolder})",
    program = "${file}",
    args = function()
      local args_string = vim.fn.input("Arguments: ")
      return vim.split(args_string, " +")
    end,
    console = "integratedTerminal",
    justMyCode = false,
    cwd = "${workspaceFolder}",
  })
  table.insert(configs, {
    type = 'python',
    request = 'attach',
    name = 'Attach (justMyCode = false)',
    connect = function()
      local host = vim.fn.input('Host [127.0.0.1]: ')
      host = host ~= '' and host or '127.0.0.1'
      local port = tonumber(vim.fn.input('Port [5678]: ')) or 5678
      return { host = host, port = port }
    end,
    justMyCode = false,
  })

  -- mappings
  require("plugins.dap-python.mappings")
end

------------ RETURN --------------
return {
  "mfussenegger/nvim-dap-python",
  ft = "python",
  dependencies = {
    "mfussenegger/nvim-dap",
  },
  config = _config,
}

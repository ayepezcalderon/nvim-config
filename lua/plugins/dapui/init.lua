---------- OPTS -----------
local _opts = {
  layouts = {
    {
      elements = {
        {
          id = "scopes",
          size = 0.25,
        },
        {

          id = "breakpoints",
          size = 0.25,
        },
        {
          id = "stacks",
          size = 0.25,
        },
        {
          id = "watches",
          size = 0.25,
        },
      },
      position = "left",
      size = 40,
    },
    {
      elements = {
        {
          id = "repl",
          size = 0.5,
        },
        {
          id = "console",
          size = 0.5,
        },
      },
      position = "bottom",
      size = 10,
    },
    {
      elements = {
        {
          id = "console",
          size = 1.0,
        },
      },
      position = "bottom",
      size = 10,
    },
  },
}

---------- CONFIG -----------
local function _config(_, opts)
  require("dapui").setup(opts)
  -- load dapui actions with one of the utils
  require("plugins.dapui.utils").load_console(true, false, false)

  -- mappings
  require("plugins.dapui.mappings")
end

return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "nvim-neotest/nvim-nio",
  },
  opts = _opts,
  config = _config,
}

local map = vim.keymap.set

map(
  {"n"},
  "<leader>dco",
  function()
    require("dapui").float_element('console')
  end,
  {desc="dapui console"}
)
map(
  {"n"},
  "<leader>dw",
  function()
    require("dapui").float_element('watches')
  end,
  {desc="dapui watches"}
)
map(
  {"n"},
  "<leader>dui",
  function()
    require('dap').repl.close()
    require("dapui").toggle()
    dap_utils.delayed_dap_controls_refresh()
  end,
  {desc="dapui toggle"}
)
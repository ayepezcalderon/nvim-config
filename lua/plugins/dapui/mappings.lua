local map = vim.keymap.set

map(
  {"n"},
  "<leader>dco",
  function()
    require('dap').repl.close()
    require("dapui").close(1)
    require("dapui").close(2)
    require("dapui").toggle(3)
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
    require("dapui").close(3)
    for i = 1, 2, 1 do
      if require("dapui.windows").layouts[i]:is_open() then
        require("dapui").close(i)
      else
        require("dapui").open(i)
      end
    end
    require("plugins.dapui.utils").delayed_dap_controls_refresh()
  end,
  {desc="dapui toggle"}
)
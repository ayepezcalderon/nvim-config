local map = vim.keymap.set

map(
  {"n"},
  "<leader>dB",
  function()
    require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: '))
  end,
  {desc="Breakpoint condition"}
)
map(
  {"n"},
  "<Leader>dr",
  function()
    require('dapui').close()
    dap_utils.custom_dap_repl_toggle(false)
  end,
  {desc="dap repl toggle"}
)
map(
  {"n"},
  "<F2>",
  function() require('dap').down() end,
  {desc="dap down"}
)
map(
  {"n"},
  "<Leader>dp",
  function()
    require('dap.ui.widgets').preview()
  end,
  {desc="dap preview"}
)
map(
  {"n"},
  "<leader>db",
  '<cmd> DapToggleBreakpoint <CR>',
  {desc="Debug breakpoint"}
)
map(
  {"n"},
  "<F9>",
  function() require('dap').step_out() end,
  {desc="dap step out"}
)
map(
  {"n"},
  "<Leader>lp",
  function()
    require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
  end,
  {desc="Log point"}
)
map(
  {"n"},
  "<F5>",
  function() require('dap').continue() end,
  {desc="dap continue"}
)
map(
  {"n"},
  "<Leader>dcb",
  function()
    require('dap').clear_breakpoints()
  end,
  {desc="dap clear breakpoints"}
)
map(
  {"n"},
  "<F8>",
  function() require('dap').step_into() end,
  {desc="dap step into"}
)
map(
  {"n"},
  "<F12>",
  function() require('dap').terminate() end,
  {desc="dap terminate"}
)
map(
  {"n"},
  "<F4>",
  function() require('dap').run_last() end,
  {desc="dap run last"}
)
map(
  {"n"},
  "<F7>",
  function() require('dap').step_over() end,
  {desc="dap step over"}
)
map(
  {"n"},
  "<Leader>ds",
  function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
    dap_utils.set_buf_easy_close_mappings()
  end,
  {desc="dap scopes"}
)
map(
  {"n"},
  "<F3>",
  function() require('dap').up() end,
  {desc="dap up"}
)
map(
  {"n"},
  "<Leader>dh",
  function()
    require('dap.ui.widgets').hover()
    dap_utils.set_buf_easy_close_mappings()
  end,
  {desc="dap hover"}
)
map(
  {"n"},
  "<Leader>dtc",
  function()
    require('dap').run_to_cursor()
  end,
  {desc="dap run to cursor"}
)
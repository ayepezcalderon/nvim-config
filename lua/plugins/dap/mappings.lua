local map = vim.keymap.set
local dap_utils = require("plugins.dap.utils")

local _HAS_RUN = false

map({ "n" }, "<leader>dB", function()
  require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Breakpoint condition" })
map({ "n" }, "<Leader>dr", function()
  require("dapui").close()
  dap_utils.custom_dap_repl_toggle(false)
end, { desc = "dap repl toggle" })
map({ "n" }, "<F2>", function()
  require("dap").down()
end, { desc = "dap down" })
map({ "n" }, "<Leader>dp", function()
  require("dap.ui.widgets").preview()
end, { desc = "dap preview" })
map({ "n" }, "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Debug breakpoint" })
map({ "n" }, "<F9>", function()
  require("dap").step_out()
end, { desc = "dap step out" })
map({ "n" }, "<Leader>lp", function()
  require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))
end, { desc = "Log point" })
map({ "n" }, "<F5>", function()
  require("dap").continue()
end, { desc = "dap continue" })
map({ "n" }, "<Leader>dcb", function()
  require("dap").clear_breakpoints()
end, { desc = "dap clear breakpoints" })
map({ "n" }, "<F8>", function()
  require("dap").step_into()
end, { desc = "dap step into" })
map({ "n" }, "<F12>", function()
  require("dap").terminate()
end, { desc = "dap terminate" })
map({ "n" }, "<F4>", function()
  if _HAS_RUN then
    require("dap").run_last()
  else
    require("dap").run(require("dap").configurations[vim.bo.filetype][1])
    _HAS_RUN = true
  end
end, { desc = "dap run last (or 1st if not ran yet)" })
map({ "n" }, "<F7>", function()
  require("dap").step_over()
end, { desc = "dap step over" })
map({ "n" }, "<Leader>ds", function()
  require("dapui").float_element("scopes", { width = vim.o.columns - 2, height = vim.o.lines - 3, enter = true })
end, { desc = "dap scopes" })
map({ "n" }, "<F3>", function()
  require("dap").up()
end, { desc = "dap up" })
map({ "n", "v" }, "<Leader>dh", function()
  require("dapui").eval()
end, { desc = "dap hover" })
map({ "n" }, "<Leader>dtc", function()
  require("dap").run_to_cursor()
end, { desc = "dap run to cursor" })

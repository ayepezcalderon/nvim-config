local M = {}

--- Custom dap repl toggle function. Can enter repl in insert mode when toggle opens
function M.custom_dap_repl_toggle(insert, ...)
  if not require("dap").repl.close { mode = "toggle" } then
    require("dap").repl.open(...)
    -- Move to repl
    vim.cmd ":wincmd p"
    -- Enter insert mode if required
    if insert then
      vim.cmd "startinsert"
    end
  end
end

-- Colors for the dap highlight groups
local bp_groups = {
  "DapBreakpoint",
  "DapBreakpointCondition",
  "DapLogPoint",
  "DapStopped",
  "DapBreakpointRejected",
}

--- Creates the colors for the stop dap hl
local function stop_hl()
  local group = "DapStopped"
  local linehl = nil
  if vim.api.nvim_get_hl(0, { name = group }).bg and group then
    linehl = group
  end
  vim.fn.sign_define(group, { text = nil, texthl = group, linehl = linehl, numhl = "" })
end

--- Creates symbols for dap breakpoints
function M.symbol_hls()
  stop_hl()
  vim.fn.sign_define("DapBreakpoint", { text = "🛑", texthl = "", linehl = "", numhl = "" })
end

--- Creates the colors for the dap hls
function M.color_hls()
  stop_hl()
  for _, group in ipairs(bp_groups) do
    vim.fn.sign_define(group, { text = nil, texthl = group, linehl = nil, numhl = nil })
  end
end

return M

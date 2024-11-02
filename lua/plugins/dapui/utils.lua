local M = {}

local dapui = require "dapui"
local dap = require "dap"

--- Refreshes the controls of the dapui repl with a delay. Default delay is 1ms.
function M.delayed_dap_controls_refresh(delay)
  local _delay = delay or 1

  vim.defer_fn(function()
    require("dapui.controls").refresh_control_panel()
  end, _delay)
end

--- Closes the (possibly) open ui
---@param close_repl boolean whether repl should be closed.
---@param close_console boolean whether console should be closed.
---@param close_dapui boolean whether dapui should be closed.
local function _close_ui(close_repl, close_console, close_dapui)
  for _, event in ipairs { "event_terminated", "event_exited" } do
    dap.listeners.before[event]["dapui_config"] = function()
      if close_repl then
        dap.repl.close()
      end
      if close_console then
        dapui.close(3)
      end
      if close_dapui then
        dapui.close(1)
        dapui.close(2)
      end
    end
  end
end

--- Loads default ui of nvim-dapui
---@param close_repl boolean wether repl should be closed upon terminate/exit events.
---@param close_dapui boolean wether dapui should be closed upon terminate/exit events.
function M.load_console(close_repl, close_console, close_dapui)
  -- Open and close UI when debug is initialiaze and terminated/exited
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dap.repl.close()
    dapui.close(1)
    dapui.close(2)
    dapui.open(3)
    M.delayed_dap_controls_refresh()
  end
  _close_ui(close_repl, close_console, close_dapui)
end

--- Loads only the console of nvim-dapui
---@param close_repl boolean wether repl should be closed upon terminate/exit events.
---@param close_dapui boolean wether dapui should be closed upon terminate/exit events.
function M.load_dapui(close_repl, close_console, close_dapui)
  -- Open and close UI when debug is initialiaze and terminated/exited
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dap.repl.close()
    dapui.close(3)
    dapui.open(1)
    dapui.open(2)
    M.delayed_dap_controls_refresh()
  end
  _close_ui(close_repl, close_console, close_dapui)
end

--- Loads ui composed of a repl with the repl controls given by nbim-dapui
---@param close_repl boolean wether repl should be closed upon terminate/exit events.
---@param close_dapui boolean wether dapui should be closed upon terminate/exit events.
function M.load_repl_ui(close_repl, close_console, close_dapui)
  -- Open and close repl when debug is initialiaze and terminated/exited
  -- First enable dapui controls for repl
  require("dapui.controls").enable_controls(require("dapui").elements["repl"])
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.close()
    require("dapui.controls").refresh_control_panel()
    dap.repl.open()
  end
  _close_ui(close_repl, close_console, close_dapui)
end

--- Loads repl controls (use when none of the other loaders is used)
---@param close_repl boolean wether repl should be closed upon terminate/exit events.
---@param close_dapui boolean wether dapui should be closed upon terminate/exit events.
function M.load_repl_controls(close_repl, close_console, close_dapui)
  require("dapui.controls").enable_controls(require("dapui").elements["repl"])
  _close_ui(close_repl, close_console, close_dapui)
end

return M

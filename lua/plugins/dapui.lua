---------- CONFIG -----------
local function _config(_, opts)
  require("dapui").setup()
  -- load dapui actions with one of the utils
  require("plugins._utils.dapui").load_repl_controls(true, false)
end

return {
  "rcarriga/nvim-dap-ui",
  config = _config,
}

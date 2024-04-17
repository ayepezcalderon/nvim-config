---------- CONFIG -----------
local function _config(_, opts)
  require("dapui").setup()
  -- load dapui actions with one of the utils
  require("plugins.dapui.utils").load_repl_controls(true, false)

  -- mappings
  require("plugins.dapui.mappings")
end

return {
  "rcarriga/nvim-dap-ui",
  dependencies = {
    "nvim-neotest/nvim-nio",
  },
  config = _config,
}

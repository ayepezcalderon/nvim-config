------------ CONFIG --------------
local function _config (_, opts)
  -- Set colors with one of the util functions
  require("plugins.dap.utils").color_hls()

  -- Telescope functionality
  -- Here for lazy loading only on dap demand, not on telescope demand
  require("telescope").load_extension("dap")

  -- mappings
  require("plugins.dap.mappings")
end

return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-telescope/telescope-dap.nvim",
  },
  config = _config,
}

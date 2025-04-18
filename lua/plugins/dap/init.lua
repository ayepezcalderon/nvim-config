------------ CONFIG --------------
local function _config(_, opts)
  -- Set highlights for the colors of the signs
  require("plugins.dap.highlights")
  -- Set colors with one of the util functions
  require("plugins.dap.utils").color_hls()

  -- Telescope functionality
  -- Here for lazy loading only on dap demand, not on telescope demand
  require("telescope").load_extension("dap")

  -- mappings
  require("plugins.dap.mappings")

  -- CONFIGURATIONS
  -- python
  -- set in by dap-python and in dap-python init
  -- codelldb
  require("plugins.dap.adapters.codelldb")
end

------------ RETURN --------------
return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-telescope/telescope-dap.nvim",
    "rcarriga/cmp-dap",
  },
  ft = { "python", "c", "cpp", "rust" },
  config = _config,
}

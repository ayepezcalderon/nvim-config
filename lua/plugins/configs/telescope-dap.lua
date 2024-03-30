return {
  "nvim-telescope/telescope-dap.nvim",
  config = function ()
    require("core.utils").load_mappings("telescope_dap")
  end
}

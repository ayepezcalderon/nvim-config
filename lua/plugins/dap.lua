local M = {}

------------ SETUP --------------
function M.setup (_, opts)
  -- Set colors with one of the util functions
  require("plugins._utils.dap").color_hls()
end

return M

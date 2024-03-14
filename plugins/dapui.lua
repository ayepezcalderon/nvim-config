local M = {}

---------- SETUP -----------
function M.setup(_, opts)
  require("dapui").setup()
  -- load dapui actions with one of the utils
  require("plugins._utils.dapui").load_repl_controls(true, false)
end

return M

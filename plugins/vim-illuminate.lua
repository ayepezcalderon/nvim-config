local M = {}

------------ OPTS -------------
M.opts = {
  delay = 100,
  large_file_cutoff = 2000,
  large_file_overrides = {
    providers = { "lsp" },
  },
}

------------ SETUP -------------
function M.setup (_, opts)
  require("illuminate").configure(opts)

  -- On demand mappings
  local map_on_demand = require("mappings.on_demand.vim-illuminate")
  map_on_demand.load()
end

return M

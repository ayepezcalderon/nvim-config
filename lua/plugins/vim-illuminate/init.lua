------------ OPTS -------------
local _opts = {
  delay = 100,
  large_file_cutoff = 2000,
  large_file_overrides = {
    providers = { "lsp" },
  },
}

------------ CONFIG -------------
local function _config(_, opts)
  require("illuminate").configure(opts)

  -- On demand mappings
  local map_on_demand = require "plugins.vim-illuminate.mappings"
  map_on_demand.load()
end

------------ RETURN -------------
return {
  "RRethy/vim-illuminate",
  lazy = false,
  opts = _opts,
  config = _config,
  -- keys = {
  --   { "]]", desc = "Next Reference" },
  --   { "[[", desc = "Prev Reference" },
  -- },
}

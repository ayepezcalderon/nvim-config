------------- OPTS -------------
local function _opts()
  return {
    -- mappings for textobjects and movements
    textobjects = require("plugins.treesitter-text-objects.mappings").textobjects
  }
end

------------- OPTS -------------
local function _config(_, opts)
  require("nvim-treesitter.configs").setup(opts)

  -- mappings for repeatable movements
  require("plugins.treesitter-text-objects.mappings").repeatable_move()
end

return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  opts = _opts,
  config = _config
}

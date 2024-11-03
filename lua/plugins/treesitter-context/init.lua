------------- OPTS -------------
local _opts = {
  enable = false,
}


------------- CONFIG -------------
local function _config(_, opts)
  require("treesitter-context").setup(opts)
  -- mappings
  require("plugins.treesitter-context.mappings")
end


------------- RETURN -------------
return {
  "nvim-treesitter/nvim-treesitter-context",
  opts = _opts,
  config = _config,
}


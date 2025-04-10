local _opts = {
  context = 10,
}

------------- CONFIG -------------
local function _config(_, opts)
  require("twilight").setup(opts)
  -- mappings
  require("plugins.twilight.mappings")
end

---------- RETURN -----------
return {
  "folke/twilight.nvim",
  init = function()
    -- Same conditions as tree-sitter
    require("utils.load_plugin").lazy_load("twilight.nvim")
  end,
  opts = _opts,
  config = _config,
}

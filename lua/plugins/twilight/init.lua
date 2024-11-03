------------- CONFIG -------------
local function _config(_, opts)
  -- mappings
  require("plugins.twilight.mappings")
end


---------- RETURN -----------
return {
  "folke/twilight.nvim",
  init = function()
    -- Same conditions as tree-sitter
    require("utils").lazy_load("twilight.nvim")
  end,
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  },
  config = _config
}

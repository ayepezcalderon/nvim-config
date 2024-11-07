---------- CONFIG ------------
local _config = function(_, opts)
  require("diffview").setup(opts)
  -- mappings
  require("plugins.diffview.mappings")
end

-------- RETURN --------
return {
  "sindrets/diffview.nvim",
  ft = { "gitcommit", "diff" },
  config = _config
}

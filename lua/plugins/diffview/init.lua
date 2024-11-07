---------- INIT ------------
local _init = require("utils").init_git_plugin("diffview", "DiffviewLazyLoad")

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
  init = _init,
  config = _config
}

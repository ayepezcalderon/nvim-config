---------- INIT ------------
local _init = require("utils").init_git_plugin("neogit", "NeogitLazyLoad")

---------- OPTS ------------
local _opts = {
  kind = "split",
}

---------- CONFIG ------------
local _config = function (_, opts)
  require("neogit").setup(opts)
  -- mappings
  require("plugins.neogit.mappings")
end

-------- RETURN --------
return {
  "NeogitOrg/neogit",
  ft = { "gitcommit", "diff" },
  init = _init,
  dependencies = {
    "nvim-lua/plenary.nvim",         -- required
    "sindrets/diffview.nvim",        -- optional - Diff integration
    "nvim-telescope/telescope.nvim", -- optional
  },
  opts = _opts,
  config = _config
}

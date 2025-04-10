---------- INIT ------------
local _init = require("utils.load_plugin").init_git_plugin("gitsigns.nvim", "GitSignsLazyLoad")

----------- OPTS ------------
local map_on_demand = require("plugins.gitsigns.mappings")

local _opts = {
  signs = {
    add = { text = "│" },
    change = { text = "│" },
    delete = { text = "󰍵" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
    untracked = { text = "│" },
  },
  on_attach = function(bufnr)
    map_on_demand.load(bufnr)
  end,
}

----------- RETURN ------------
return {
  "lewis6991/gitsigns.nvim",
  dependencies = { "tpope/vim-fugitive" },
  ft = { "gitcommit", "diff" },
  init = _init,
  opts = _opts,
  config = function(_, opts)
    require("gitsigns").setup(opts)
  end,
}

local map_on_demand = require("mappings.on_demand.gitsigns")

local opts = {
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

return opts

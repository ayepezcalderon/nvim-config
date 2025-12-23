-------- OPTS --------
local _opts = {
  syntax_highlight = true,
}

return {
  "GCBallesteros/NotebookNavigator.nvim",
  keys = {
    { "]c",         function() require("notebook-navigator").move_cell "d" end },
    { "[c",         function() require("notebook-navigator").move_cell "u" end },
    { "csj",         function() require("notebook-navigator").swap_cell "d" end },
    { "csk",         function() require("notebook-navigator").swap_cell "u" end },
    { "<leader>cn",         function() require("notebook-navigator").split_cell() end },
    -- { "<leader>ccm",         function() require("notebook-navigator").merge_cell "d" end },
    { "[c",         function() require("notebook-navigator").move_cell "u" end },
    { "<leader>sb", "<cmd>lua require('notebook-navigator').run_cell()<cr>" },
    { "<leader>sn", "<cmd>lua require('notebook-navigator').run_and_move()<cr>",
    },
  },
  dependencies = {
    -- "echasnovski/mini.comment",
    "hkupty/iron.nvim", -- repl provider
    -- "akinsho/toggleterm.nvim", -- alternative repl provider
    -- "benlubas/molten-nvim", -- alternative repl provider
    -- "anuvyklack/hydra.nvim",
  },
  event = "VeryLazy",
  opts = _opts,
  -- config = function()
  --   local nn = require "notebook-navigator"
  --   -- nn.setup({ activate_hydra_keys = "<leader>h" })
  -- end,
}

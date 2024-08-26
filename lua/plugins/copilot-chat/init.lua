---------- OPTS ------------
local _opts = {
  debug = true, -- Enable debugging

  -- window = {
  --   layout = 'float',
  --   relative = 'cursor',
  --   width = 1,
  --   height = 0.4,
  --   row = 1
  -- },

}

---------- RETURN ------------
return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
  -- cmd = "Copilot",
  lazy = false,
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    opts = _opts,
    config = function (_, opts)
      require("CopilotChat").setup(opts)
      require("plugins.copilot-chat.mappings")
    end,
  },
}

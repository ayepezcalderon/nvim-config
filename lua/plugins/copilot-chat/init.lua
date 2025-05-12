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

  mappings = {
    reset = {
      normal = "<C-g>",
      insert = "<C-g>",
    }
  },

  prompts = {
    ExplainCodeBase = {
      prompt = "Explain this codebase in detail. It is my first time seeing it and I want to learn it in depth.",
      system_prompt = "COPILOT_EXPLAIN",
      description = "Explain the codebase in detail.",
      mapping = "<leader>ccb",
      sticky = {
        "#files",
      },
    },
    PullRequest = {
      prompt =
      "The git diff defines changes for this PR. Suggest improvements in terms of code quality, performance, security and debugging. Phrase your answer as an enumerated review comment.",
      system_prompt = "COPILOT_REVIEW",
      mapping = "<leader>ccpr",
      description = "Review the git diff as a pull request.",
      sticky = {
        "#files",
        "#git",
      },
    },
  }
}

---------- RETURN ------------
return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "main",
    -- cmd = "Copilot",
    lazy = false,
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    opts = _opts,
    config = function(_, opts)
      require("CopilotChat").setup(opts)
      require("plugins.copilot-chat.mappings")
    end,
  },
}

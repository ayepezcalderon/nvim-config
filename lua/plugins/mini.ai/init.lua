return {
  "nvim-mini/mini.ai",
  event = "VeryLazy",
  dependencies = { "GCBallesteros/NotebookNavigator.nvim" },
  opts = function()
    local nn = require "notebook-navigator"

    local opts = { custom_textobjects = { c = nn.miniai_spec } }
    return opts
  end,
}

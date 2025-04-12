-------- OPTS --------
local _opts = {
  filetypes = {
    markdown = true,
    python = true,
    lua = true,
    javascript = true,
    typescript = true,
    c = true,
    cpp = true,
    rust = true,
    sh = true,
    ["*"] = false,
  },
  suggestion = {
    auto_trigger = true,
    keymap = {
      accept = "<Tab>",
      accept_line = "<S-Tab>",
      accept_word = "<C-Tab>",
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
  },
}

-------- OPTS --------
require("plugins.copilot.mappings").nonlazy()
return {
  "zbirenbaum/copilot.lua",
  -- event = "InsertEnter",
  -- cmd = "Copilot",
  lazy = false,
  build = ":Copilot auth",
  opts = _opts,
  config = function(_, opts)
    require("copilot").setup(opts)
    require("plugins.copilot.mappings").lazy()
  end,
}

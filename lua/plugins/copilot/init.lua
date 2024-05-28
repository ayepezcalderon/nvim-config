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
      accept = "<M-l>",
      accept_line = "<M-k>",
      accept_word = "<M-j>",
      next = "<M-]>",
      prev = "<M-[>",
      dismiss = "<C-]>",
    },
  },
}

-------- OPTS --------
return {
  "zbirenbaum/copilot.lua",
  -- event = "InsertEnter",
  cmd = "Copilot",
  build = ":Copilot auth",
  opts = _opts,
  config = function (_, opts)
    require("copilot").setup(opts)
  end
}

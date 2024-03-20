------------ OPTS -------------
local _opts = {
  indentLine_enabled = 1,
  filetype_exclude = {
    "help",
    "terminal",
    "lazy",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "mason",
    "nvdash",
    "nvcheatsheet",
    "",
  },
  buftype_exclude = { "terminal" },
  show_trailing_blankline_indent = false,
  show_first_indent_level = false,
  show_current_context = true,
  show_current_context_start = true,
}

------------ RETURN -------------
return {
  "lukas-reineke/indent-blankline.nvim",
  version = "2.20.7",
  init = function()
    require("plugins._utils._general").lazy_load("indent-blankline.nvim")
  end,
  opts = _opts,
  config = function(_, opts)
    require("indent_blankline").setup(opts)
  end,
}

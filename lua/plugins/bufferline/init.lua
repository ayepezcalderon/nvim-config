------ OPTS -------
local _opts = {
  options = {
    mode = "tabs",
    separator_style = "slant",
  },
  highlights = require("catppuccin.groups.integrations.bufferline").get()
}

------ RETURN -------
return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = _opts
}

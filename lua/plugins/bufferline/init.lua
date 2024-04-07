------ OPTS -------
local _opts = {
  options = {
    mode = "tabs",
    separator_style = "slant",
  },
}

------ RETURN -------
return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = _opts
}

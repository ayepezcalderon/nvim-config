------ OPTS -------
local function _opts()
  return {
    options = {
      separator_style = "slant",
      offsets = {
        {
          filetype = "NvimTree",
          -- text = "File Explorer",
          text_align = "center",
          separator = true
        }
      },
    },
    highlights = require("catppuccin.groups.integrations.bufferline").get(),
  }
end

------ RETURN -------
return {
  "akinsho/bufferline.nvim",
  lazy=false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = _opts,
  config = function(_, opts)
    require("bufferline").setup(opts)
    -- mappings
    require("plugins.bufferline.mappings")
  end,
}

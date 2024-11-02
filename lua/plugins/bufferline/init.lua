------ OPTS -------
local function _opts()
  local bufferline = require "bufferline"

  return {
    options = {
      separator_style = "slant",
      offsets = {
        {
          filetype = "NvimTree",
          -- text = "File Explorer",
          text_align = "center",
          separator = false,
        },
      },
      style_preset = {
        bufferline.style_preset.no_italic,
        bufferline.style_preset.no_bold,
        bufferline.style_preset.minimal,
      },
    },
    -- highlights = require("catppuccin.groups.integrations.bufferline").get(),
  }
end

------ RETURN -------
return {
  "akinsho/bufferline.nvim",
  lazy = false,
  enabled = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = _opts,
  config = function(_, opts)
    require("bufferline").setup(opts)
    -- mappings
    require "plugins.bufferline.mappings"
  end,
}

------ OPTS -------
local lazy_status = require("lazy.status") -- to configure lazy pending updates count
local _opts = {
  -- options = {
  -- theme = "catppuccin"
  -- },
  sections = {
    lualine_x = {
      {
        lazy_status.updates,
        cond = lazy_status.has_updates,
        color = { fg = "#ff9e64" },
      },
      { "encoding" },
      { "fileformat" },
      { "filetype" },
    },
  },
  disabled_filetypes = {
  },
}

------ RETURN -------
return {
  "nvim-lualine/lualine.nvim",
  lazy = false,
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = _opts,
  config = function(_, opts)
    require("lualine").setup(opts)
  end,
}

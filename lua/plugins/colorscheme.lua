-- Use this file for any colorschemes that you wish to install.
-- Comes with catppuccin by default.
return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy=false,
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme catppuccin]])
    end,
  },
}


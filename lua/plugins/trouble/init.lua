return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  ft = {'python', 'lua'},
  config = function (_, opts)
    require("trouble").setup(opts)
    -- mappings
    require("plugins.trouble.mappings")
  end
}

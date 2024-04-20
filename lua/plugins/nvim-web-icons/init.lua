return {
  "nvim-tree/nvim-web-devicons",
  priority=999,
  config = function(_, opts)
    require("nvim-web-devicons").setup(opts)
  end,
}

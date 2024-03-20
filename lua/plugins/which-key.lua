-- Only load whichkey after all the gui
return {
  "folke/which-key.nvim",
  keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g" },
  cmd = "WhichKey",
  config = function(_, opts)
    require("which-key").setup(opts)
  end,
}

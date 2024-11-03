-- Only load whichkey after all the gui
return {
  "folke/which-key.nvim",
  -- keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g" },
  lazy=false,
  cmd = "WhichKey",
  config = function(_, opts)
    require("which-key").setup(opts)
    -- mappings
    require("plugins.which-key.mappings")
  end,
}

return {
  "neovim/nvim-lspconfig",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  init = function()
    require("utils.load_plugin").lazy_load("nvim-lspconfig")
  end,
  -- config = _config,
}

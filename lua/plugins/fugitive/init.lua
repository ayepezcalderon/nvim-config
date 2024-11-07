----------- RETURN ------------
return {
  "tpope/vim-fugitive",
  lazy = false,
  config = function(_, opts)
    require("plugins.fugitive.mappings")
  end,
}

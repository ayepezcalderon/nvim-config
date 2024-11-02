----------- RETURN ------------
return {
  "tpope/vim-fugitive",
  ft = { "gitcommit", "diff" },
  config = function(_, opts)
    require "plugins.fugitive.mappings"
  end,
}

---------- OPTS ----------
local _opts = {
  snippet_engine = "luasnip",

  languages = {
    python = {
      template = {
        annotation_convention = "numpydoc",
      },
    },
  },
}

---------- RETURN ----------
return {
  "danymat/neogen",
  dependencies = "nvim-treesitter/nvim-treesitter",
  ft = {"python", "lua"},
  opts = _opts,
  config = function (_, opts)
    require("neogen").setup(opts)
    -- mappings
    require("plugins.neogen.mappings")
  end
  -- Uncomment next line if you want to follow only stable versions
  -- version = "*" 
}

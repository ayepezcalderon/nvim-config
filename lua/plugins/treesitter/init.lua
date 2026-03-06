---------- OPTS -----------
local _opts = {
}

---------- CONFIG -----------
local _config = function(_, opts)
  -- vim.treesitter.start()
  -- vim.o.foldmethod = "expr"
  -- vim.o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
  -- vim.o.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"

  require('nvim-treesitter').install {
    -- defaults
    "vim",
    "lua",

    -- web dev
    "markdown",
    "html",
    "css",
    "javascript",
    "typescript",

    -- high level
    "python",
    "cpp",
    "rust",

    -- low level
    "c",

    -- shell
    "bash",

    -- build
    "cmake",
    "make",

    -- reporting
    "latex",

    -- documentation
    "vimdoc",

    -- database
    "sql",

    -- serialization
    "json",
    -- "jsonc",
    "yaml",
    "toml",

    -- regex
    "regex",

    -- csv
    "csv",

    -- templating
    "jinja",
    -- "jinja-inline",

    -- other
    "diff",
  }
end

---------- RETURN -----------
return {
  "nvim-treesitter/nvim-treesitter",
  init = function()
    require("utils.load_plugin").lazy_load("nvim-treesitter")
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/nvim-treesitter-context",
  },
  -- build = ":TSUpdate",
  opts = _opts,
  config = _config,
}

---------- OPTS -----------
local _opts = {
  ensure_installed = {
    -- defaults
    "vim",
    "lua",

    -- web dev
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
    "jsonc",
    "yaml",
    "toml",

    -- regex
    "regex",

    -- csv
    "csv",
  },

  highlight = {
    enable = true,
    use_languagetree = true,
    disable = {
      "latex",
    },
  },

  indent = { enable = true },
}

---------- RETURN -----------
return {
  "nvim-treesitter/nvim-treesitter",
  init = function()
    require("utils").lazy_load("nvim-treesitter")
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "nvim-treesitter/nvim-treesitter-context",
  },
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  build = ":TSUpdate",
  opts = _opts,
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
    vim.o.foldmethod = 'expr'
    vim.o.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
  end,
}

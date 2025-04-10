local M = {}

M.lsp = {
  semantic_tokens = false,
  servers = {
    python = { "basedpyright", "ruff" },
    lua = { "lua_ls" },
    cpp = { "clangd" },
    c = { "clangd" },
    cuda = { "clangd" },

    json = { "jsonls" },

    tex = { "ltex" , "texlab" },
    bib = { "ltex", "texlab" },
    plaintex = { "ltex", "texlab" },
    gitcommit = { "ltex" },
    markdown = { "ltex" },
    org = { "ltex" },
    rst = { "ltex" },
    rnoweb = { "ltex" },
    pandoc = { "ltex" },
    quarto = { "ltex" },
    rmd = { "ltex" },
    context = { "ltex" },
    html = { "ltex" },
    xhtml = { "ltex" },
    mail = { "ltex" },
    text = { "ltex" },
  },
}

M.lazy = {
  defaults = { lazy = true },

  -- ui = {
  --   icons = {
  --     ft = "",
  --     lazy = "󰂠 ",
  --     loaded = "",
  --     not_loaded = "",
  --   },
  -- },
  --
  -- performance = {
  --   rtp = {
  --     disabled_plugins = {
  --       "2html_plugin",
  --       "tohtml",
  --       "getscript",
  --       "getscriptPlugin",
  --       "gzip",
  --       "logipat",
  --       "netrw",
  --       "netrwPlugin",
  --       "netrwSettings",
  --       "netrwFileHandlers",
  --       "matchit",
  --       "tar",
  --       "tarPlugin",
  --       "rrhelper",
  --       "spellfile_plugin",
  --       "vimball",
  --       "vimballPlugin",
  --       "zip",
  --       "zipPlugin",
  --       "tutor",
  --       "rplugin",
  --       "syntax",
  --       "synmenu",
  --       "optwin",
  --       "compiler",
  --       "bugreport",
  --       "ftplugin",
  --     },
  --   },
  -- },
}

return M

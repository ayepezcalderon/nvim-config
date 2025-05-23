local M = {}

M.dashboard = {
  -- hyper or doom
  theme = "doom",
}

M.cmp = {
  enabled = true,
  -- boolean or list of filetypes
  autocomplete = { "python", "lua", "json", "cpp", "c", "rust", "bash" },
  max_view_entries = 10,
}

M.lsp = {
  semantic_tokens = true,
  format_on_save = true,
  servers = {
    "basedpyright",
    "ruff",
    "lua_ls",
    "jsonls",
    "ltex",
    "clangd",
    "texlab",
    "rust_analyzer",
    "bashls"
  },
  nvim_lint_server_spec = {
    -- python = { "mypy" },
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

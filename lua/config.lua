local M = {}

M.dashboard = {
  -- hyper or doom
  theme = "doom",
}

-- gpaste-client or wl-clipboard
M.wayland_paste_provider = "wl-clipboard"

M.cmp = {
  enabled = true,
  -- boolean or list of filetypes
  autocomplete = { "python", "lua", "json", "cpp", "c", "rust", "bash", "tex", },
  max_view_entries = 10,
}

M.lsp = {
  semantic_tokens = true,
  format_on_save = true,
  virtual_lines = function(namespace, bufnr)
    if vim.bo[bufnr].filetype == "tex" then
      return false
    end
    return {
      current_line = true,
    }
  end,
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

-- Load the config from the current working directory, if it exists
local function load_local_config()
  local ok, local_conf = pcall(dofile, "./config.lua")
  if ok and type(local_conf) == "table" then
    return local_conf
  end
  return {}
end

local local_conf = load_local_config()
M = vim.tbl_deep_extend("force", M, local_conf)

return M

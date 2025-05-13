---------- OPTS -----------
local _opts = {
  log_level = "error",
  auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
  auto_session_use_git_branch = false,
  auto_restore = false,
  bypass_save_filetypes = { 'dashboard' },
  post_restore_cmds = {
    "e",
  },
}

---------- RETURN -----------
return {
  "rmagatti/auto-session",
  -- enabled = false,
  lazy   = false,
  opts   = _opts,
  config = function(_, opts)
    require("auto-session").setup(opts)
    -- mappings
    require("plugins.auto-session.mappings")
  end,
}

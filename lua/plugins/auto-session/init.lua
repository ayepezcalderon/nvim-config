---------- OPTS -----------
local _opts = {
  log_level = "error",
  auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
  auto_session_use_git_branch = false,
}

---------- RETURN -----------
return {
  "rmagatti/auto-session",
  enabled = false,
  lazy    = false,
  opts    = _opts,
  config  = function(_, opts)
    require("auto-session").setup(opts)
    -- mappings
    require("plugins.auto-session.mappings")
  end,
}

------- OPTS -------
local _opts = {
  integrations = {
    leap = true,
    mason = true,
    trouble = true,
    which_key = true,
    -- on configs of other apps:
    -- bufferline
    -- lualine
  }
}

------- RETURN -------
return {
  "catppuccin/nvim",
  name="catppuccin",
  priority=1000,
  opts=_opts,
  config = function (_, opts)
    require("catppuccin").setup(opts)
  end
}

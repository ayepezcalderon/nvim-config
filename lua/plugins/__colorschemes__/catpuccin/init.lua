------- OPTS -------
local _opts = {
  integrations = {
    leap = true,
    mason = true,
    trouble = true,
    which_key = true,
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

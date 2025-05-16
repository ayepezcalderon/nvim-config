local _opts = {
  plugins = {
    tmux = { enabled = true },
    kitty = { enabled = true },
    alacritty = { enabled = true },
  },
}


------ RETURN -------
return {
  "folke/zen-mode.nvim",
  lazy = false,
  opts = _opts,
  config = function(_, opts)
    require("zen-mode").setup(opts)

    require("plugins.zen-mode.mappings")
  end,
}

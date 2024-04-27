---------- OPTS ----------
local _opts = {
  highlight = {
    on_put = false,
    on_yank = false,
    timer = 300,
  },
  preserve_cursor_position = {
    enabled = true,
  },
  textobj = {
    enabled = true,
  },

  system_clipboard = {
    sync_with_ring = true,
  },
}

---------- RETURN ----------
return {
  "gbprod/yanky.nvim",
  lazy = false,
  opts = _opts,
  config = function(_, opts)
    require("yanky").setup(opts)
    -- mappings
    require("plugins.yanky.mappings")
  end
}

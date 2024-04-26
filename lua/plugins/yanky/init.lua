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

  -- NEEDED FOR WAYLAND -> vim.o.clipboard SHOULD NOT be set to a register in wayland
  system_clipboard = {
    sync_with_ring = false,
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

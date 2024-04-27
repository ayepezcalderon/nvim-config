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
    -- DO NOT USE wl-clipboard IN WAYLAND
    -- CREATES WINDOWS FOR EVERY COPY, WHICH LEADS TU BUGGY/CRASHY BEHAVIOR
    sync_with_ring = vim.fn.executable('gpaste-client') == 1,
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

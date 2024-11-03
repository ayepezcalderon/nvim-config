---------- RETURN -----------
local _opts = {
  focus = true, -- Focus the window when opened
  keys = {
    ["?"] = "help",
    r = "refresh",
    R = "toggle_refresh",
    q = "close",
    o = "jump",
    ["<esc>"] = "cancel",
    ["<cr>"] = "jump_close",
    ["<c-s>"] = "jump_split",
    ["<c-v>"] = "jump_vsplit",
    dd = "delete",
    d = { action = "delete", mode = "v" },
    i = "inspect",
    p = "preview",
    P = "toggle_preview",
    zo = "fold_open",
    zO = "fold_open_recursive",
    zc = "fold_close",
    zC = "fold_close_recursive",
    za = "fold_toggle",
    zA = "fold_toggle_recursive",
    zm = "fold_more",
    zM = "fold_close_all",
    zr = "fold_reduce",
    zR = "fold_open_all",
    zx = "fold_update",
    zX = "fold_update_all",
    zn = "fold_disable",
    zN = "fold_enable",
    zi = "fold_toggle_enable",
  },
}


---------- RETURN -----------
return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  ft = { "python", "lua", "c", "cpp", "rust" },
  opts = _opts,
  config = function(_, opts)
    require("trouble").setup(opts)
    -- mappings
    require("plugins.trouble.mappings")
  end,
}

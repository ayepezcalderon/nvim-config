-------------- CONFIG ------------
local function _config(_, opts)
  -- On demand mappings
  local map_on_demand = require("plugins.leap.mappings")
  map_on_demand.load()

  -- Workaround for the duplicate cursor bug when autojumping (Until neovim/neovim#20793 is fixed)
  -- Hide the (real) cursor when leaping, and restore it afterwards.
  vim.api.nvim_create_autocmd("User", {
    pattern = "LeapEnter",
    callback = function()
      vim.cmd.hi("Cursor", "blend=100")
      vim.opt.guicursor:append({ "a:Cursor/lCursor" })
    end,
  })
  vim.api.nvim_create_autocmd("User", {
    pattern = "LeapLeave",
    callback = function()
      vim.cmd.hi("Cursor", "blend=0")
      vim.opt.guicursor:remove({ "a:Cursor/lCursor" })
    end,
  })
end

-------------- RETURN ------------
return {
  "ggandor/leap.nvim",
  lazy = false,
  config = _config,
}

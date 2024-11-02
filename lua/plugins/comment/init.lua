local _enabled = false

-- mappings
if _enabled then
  require "plugins.comment.mappings"
end

return {
  enabled = _enabled,
  "numToStr/Comment.nvim",
  keys = {
    { "gcc", mode = "n", desc = "Comment toggle current line" },
    { "gc", mode = { "n", "o" }, desc = "Comment toggle linewise" },
    { "gc", mode = "x", desc = "Comment toggle linewise (visual)" },
    { "gbc", mode = "n", desc = "Comment toggle current block" },
    { "gb", mode = { "n", "o" }, desc = "Comment toggle blockwise" },
    { "gb", mode = "x", desc = "Comment toggle blockwise (visual)" },
  },
  config = function(_, opts)
    require("Comment").setup(opts)
    -- highlights
    require "plugins.comment.highlights"
  end,
}

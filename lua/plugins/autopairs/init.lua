----------- OPTS ---------
local _opts = {
  fast_wrap = {},
  disable_filetype = { "TelescopePrompt", "vim" },
}

----------- CONFIG ---------
local _config = function(_, opts)
  require("nvim-autopairs").setup(opts)
  -- setup cmp for autopairs
  local cmp_autopairs = require("nvim-autopairs.completion.cmp")
  require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
end

return {
  "windwp/nvim-autopairs",
  opts = _opts,
  config = _config,
}

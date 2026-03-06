------------- OPTS -------------
local function _opts()
  return {
    select = {
      -- Automatically jump forward to textobj, similar to targets.vim
      lookahead = true,

    },
    move = {
      set_jumps = true, -- whether to set jumps in the jumplist
    },
  }
end

------------- CONFIG -------------
local function _config(_, opts)
  require("nvim-treesitter-textobjects").setup(opts)

  -- mappings
  require("plugins.treesitter-text-objects.mappings")
end

------------- RETURN -------------
return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  opts = _opts,
  config = _config,
}

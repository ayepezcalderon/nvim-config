------- OPTS --------
local _opts = {
  enabled = false,
}


------- RETURN -------
return {
  'MeanderingProgrammer/render-markdown.nvim',
  dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
  ft = { "markdown", "norg", "rmd", "org", "codecompanion" },
  opts = _opts,
  config = function(_, opts)
    require('render-markdown').setup(opts)
    require('plugins.render-markdown.mappings')
  end,
}

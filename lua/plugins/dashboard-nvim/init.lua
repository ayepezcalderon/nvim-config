---------- OPTS -----------
local _opts = {
  theme = 'hyper',
  config = {
    week_header = {
      enable = true,
    },
    hide = {
    },
    shortcut = {
      { desc = 'Find file', group = '@property', action = 'Telescope find_files', key = 'f' },
      { desc = 'Recently opened files', group = '@property', action = 'Telescope oldfiles', key = 'r' },
      { desc = 'Find word', group = '@property', action = 'Telescope live_grep', key = 'w' },
      { desc = 'Settings', group = '@property', action = 'e ~/.config/nvim/init.lua | cd ~/.config/nvim', key = 's' },
      { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
    },
    footer = {}
  },
}

return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  opts = _opts,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}

local config = require('config')

---------- OPTS -----------
local _opts = {
  -- hyper or doom
  theme = 'doom',
  -- For hyper theme, change to cwd of opened file
  change_to_vcs_root = true,
  config = {
    header = {
    },
    week_header = {
      enable = true,
    },
    hide = {
    },
    shortcut = {
      { desc = 'Restore session', group = '@property', action = 'SessionRestore', key = 'r' },
      { desc = 'Find file', group = '@property', action = 'Telescope find_files', key = 'f' },
      { desc = 'Recently opened files', group = '@property', action = 'Telescope oldfiles', key = 'o' },
      { desc = 'Find word', group = '@property', action = 'Telescope live_grep', key = 'w' },
      { desc = 'Settings', group = '@property', action = 'e ~/.config/nvim/init.lua | cd ~/.config/nvim', key = 's' },
      { desc = '󰊳 Update', group = '@property', action = 'Lazy update', key = 'u' },
    },
    center = {
      { icon = '  ', desc = 'Restore session', action = 'SessionRestore', key = 'r' },
      { icon = '  ', desc = 'Find file', action = 'Telescope find_files', key = 'f' },
      { icon = '  ', desc = 'Recently opened files', action = 'Telescope oldfiles', key = 'o' },
      { icon = '  ', desc = 'Find word', action = 'Telescope live_grep', key = 'w' },
      { icon = '  ', desc = 'Settings', action = 'e ~/.config/nvim/init.lua | cd ~/.config/nvim', key = 's' },
      { icon = '  ', desc = '.bashrc', action = 'e ~/.bashrc | cd ~', key = 'b' },
      { icon = '  ', desc = '.profile', action = 'e ~/.profile | cd ~', key = 'p' },
      { icon = '  ', desc = '.bash_aliases', action = 'e ~/.bash_aliases | cd ~', key = 'a' },
      { icon = '󰊳  ', desc = 'Update', action = 'Lazy update', key = 'u' },
    },
    footer = {}
  },
}

---------- CONFIG ---------
local _config = function(_, opts)
  local dashboard = require('dashboard')
  dashboard.setup(opts)

  -- taken from lazy.nvim
  -- open dashboard after closing lazy
  if vim.o.filetype == "lazy" then
    vim.api.nvim_create_autocmd("WinClosed", {
      pattern = tostring(vim.api.nvim_get_current_win()),
      once = true,
      callback = function()
        vim.schedule(function()
          vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
        end)
      end,
    })
  end
end

---------- RETURN ---------
return {
  'nvimdev/dashboard-nvim',
  event = 'VimEnter',
  opts = vim.tbl_deep_extend("force", _opts, config.dashboard),
  config = _config,
  dependencies = { { 'nvim-tree/nvim-web-devicons' } }
}

-- specify ui
local colorscheme_plugin = "catppuccin"
vim.g.colorscheme = "catppuccin"

-- remap leader key
vim.g.mapleader = " "

-- disable some default providers
for _, provider in ipairs { "node", "perl", "python3", "ruby" } do
  vim.g["loaded_" .. provider .. "_provider"] = 0
end

-- add binaries installed by mason.nvim to path
local is_windows = vim.loop.os_uname().sysname == "Windows_NT"
vim.env.PATH = vim.fn.stdpath "data" .. "/mason/bin" .. (is_windows and ";" or ":") .. vim.env.PATH

-- load nvim core config that executes before loading plugins
-- (other parts load after in after/plugin)
require "core"

-- bootstrap lazy
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- load plugins
local lazy_config = require "lazy_config"
require("lazy").setup(
  { { import = "plugins.__colorschemes__." .. colorscheme_plugin }, { import = "plugins" } },
  lazy_config
)

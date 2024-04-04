-- remap leader key
vim.g.mapleader = " "local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- load core
require("core")

-- bootstrap lazy
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- load plugins
local lazy_config = require("lazy_config")
require("lazy").setup({ { import = "plugins" }, }, lazy_config)


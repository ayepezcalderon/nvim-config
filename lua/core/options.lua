local opt = vim.opt
local o = vim.o

opt.relativenumber = true
o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.cmd("set nofixeol")

opt.laststatus = 3 -- global statusline
opt.showmode = false

-- DO NOT USE wl-clipboard in wayland to synchronize to clipboard registers
-- CREATES WINDOWS FOR EVERY COPY, WHICH LEADS TU BUGGY/CRASHY BEHAVIOR
-- unnamedplus is more of an issue than unnamed because it is used more often
if os.getenv("WAYLAND_DISPLAY") and vim.fn.executable("gpaste-client") == 1 then
  vim.g.clipboard = {
    name = "gpaste",
    copy = {
      ["+"] = { "gpaste-client" },
      ["*"] = { "gpaste-client" },
    },
    paste = {
      ["+"] = { "gpaste-client", "--use-index", "get", "0" },
      ["*"] = { "gpaste-client", "--use-index", "get", "0" },
    },
    cache_enabled = true,
  }
end
if vim.g.clipboard or not os.getenv("WAYLAND_DISPLAY") then
  opt.clipboard = "unnamedplus"
end

opt.cursorline = true

-- Indenting
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

opt.fillchars = { eob = " " }
opt.ignorecase = true
opt.smartcase = true
opt.mouse = "a"

-- Numbers
opt.number = true
opt.numberwidth = 2
opt.ruler = false

-- disable nvim intro
opt.shortmess:append("sI")

opt.signcolumn = "yes"
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.timeoutlen = 400
opt.undofile = true

-- interval for writing swap file to disk, also used by gitsigns
opt.updatetime = 250

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append("<>[]hl")

-- Folding
opt.foldlevel = 99

-- Default border style of floating windows
vim.o.winborder = "rounded"

-- TODO: Delete this once you figure out how to not have autos-session break this
-- vim.g._ts_force_sync_parsing = true

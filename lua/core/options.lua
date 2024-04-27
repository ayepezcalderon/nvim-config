local opt = vim.opt
local o = vim.o

opt.relativenumber = true
o.sessionoptions="blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
vim.cmd('set nofixeol')

opt.laststatus = 3 -- global statusline
opt.showmode = false


-- DO NOT USE wl-clipboard IN WAYLAND TO SYNCHRONIZE TO CLIPBOARD
-- CREATES WINDOWS FOR EVERY COPY, WHICH LEADS TU BUGGY/CRASHY BEHAVIOR
if vim.fn.executable('gpaste-client') == 1 then
  vim.g.clipboard = {
    name = 'gpaste',
    copy = {
      ["+"] = { 'gpaste-client' },
      ["*"] = { 'gpaste-client' },
    },
    paste = {
      ["+"] = { 'gpaste-client', '--use-index', 'get', '0' },
      ["*"] = { 'gpaste-client', '--use-index', 'get', '0' },
    },
    cache_enabled = true,
  }
end
opt.clipboard = "unnamedplus"

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
opt.shortmess:append "sI"

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
opt.whichwrap:append "<>[]hl"

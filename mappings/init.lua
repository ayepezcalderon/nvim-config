local map = vim.keymap.set

------- COMMENT -------
map(
  {"v"},
  "<leader>/",
  "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>",
  {desc="Toggle comment"}
)
map(
  {"n"},
  "<leader>/",
  112,
  {desc="Toggle comment"}
)

------- TROUBLE -------
map(
  {"n"},
  "<leader>tw",
  46,
  {desc="Toggle workspace diagnostics"}
)
map(
  {"n"},
  "<leader>tg",
  52,
  {desc="Toggle document diagnostics"}
)
map(
  {"n"},
  "<leader>tq",
  58,
  {desc="Toggle quickfix"}
)
map(
  {"n"},
  "<leader>tl",
  64,
  {desc="Toggle loclist"}
)
map(
  {"n"},
  "<leader>tx",
  40,
  {desc="Toggle trouble"}
)
map(
  {"n"},
  "<leader>tr",
  70,
  {desc="Toggle LSP references"}
)

------- NVIMTREE -------
map(
  {"n"},
  "<leader>e",
  '<cmd> NvimTreeFocus <CR>',
  {desc="Focus nvimtree"}
)
map(
  {"n"},
  "<C-n>",
  '<cmd> NvimTreeToggle <CR>',
  {desc="Toggle nvimtree"}
)

------- DAP_PYTHON -------
map(
  {"n"},
  "<leader>dpr",
  221,
  {desc="Debug python run"}
)

------- LSPCONFIG -------
map(
  {"v"},
  "<leader>ca",
  248,
  {desc="LSP code action"}
)
map(
  {"n"},
  "<leader>D",
  169,
  {desc="LSP definition type"}
)
map(
  {"n"},
  "<leader>wl",
  239,
  {desc="List workspace folders"}
)
map(
  {"n"},
  "[d",
  204,
  {desc="Goto prev"}
)
map(
  {"n"},
  "gr",
  190,
  {desc="LSP references"}
)
map(
  {"n"},
  "<leader>wa",
  225,
  {desc="Add workspace folder"}
)
map(
  {"n"},
  "<leader>ra",
  176,
  {desc="LSP rename"}
)
map(
  {"n"},
  "gd",
  141,
  {desc="LSP definition"}
)
map(
  {"n"},
  "<leader>wr",
  232,
  {desc="Remove workspace folder"}
)
map(
  {"n"},
  "<leader>q",
  218,
  {desc="Diagnostic setloclist"}
)
map(
  {"n"},
  "]d",
  211,
  {desc="Goto next"}
)
map(
  {"n"},
  "K",
  148,
  {desc="LSP hover"}
)
map(
  {"n"},
  "<leader>lf",
  197,
  {desc="Floating diagnostic"}
)
map(
  {"n"},
  "<leader>ca",
  183,
  {desc="LSP code action"}
)
map(
  {"n"},
  "gi",
  155,
  {desc="LSP implementation"}
)
map(
  {"n"},
  "gD",
  134,
  {desc="LSP declaration"}
)
map(
  {"n"},
  "<leader>ls",
  162,
  {desc="LSP signature help"}
)

------- DAP -------
map(
  {"n"},
  "<leader>dB",
  108,
  {desc="Breakpoint condition"}
)
map(
  {"n"},
  "<Leader>dr",
  120,
  {desc="dap repl toggle"}
)
map(
  {"n"},
  "<F2>",
  140,
  {desc="dap down"}
)
map(
  {"n"},
  "<Leader>dp",
  158,
  {desc="dap preview"}
)
map(
  {"n"},
  "<leader>db",
  '<cmd> DapToggleBreakpoint <CR>',
  {desc="Debug breakpoint"}
)
map(
  {"n"},
  "<F9>",
  146,
  {desc="dap step out"}
)
map(
  {"n"},
  "<Leader>lp",
  114,
  {desc="Log point"}
)
map(
  {"n"},
  "<F5>",
  143,
  {desc="dap continue"}
)
map(
  {"n"},
  "<Leader>dcb",
  127,
  {desc="dap clear breakpoints"}
)
map(
  {"n"},
  "<F8>",
  145,
  {desc="dap step into"}
)
map(
  {"n"},
  "<F12>",
  147,
  {desc="dap terminate"}
)
map(
  {"n"},
  "<F4>",
  142,
  {desc="dap run last"}
)
map(
  {"n"},
  "<F7>",
  144,
  {desc="dap step over"}
)
map(
  {"n"},
  "<Leader>ds",
  173,
  {desc="dap scopes"}
)
map(
  {"n"},
  "<F3>",
  141,
  {desc="dap up"}
)
map(
  {"n"},
  "<Leader>dh",
  151,
  {desc="dap hover"}
)
map(
  {"n"},
  "<Leader>dtc",
  133,
  {desc="dap run to cursor"}
)

------- NVTERM -------
map(
  {"t"},
  "<A-h>",
  308,
  {desc="Toggle horizontal term"}
)
map(
  {"t"},
  "<A-i>",
  301,
  {desc="Toggle floating term"}
)
map(
  {"t"},
  "<A-v>",
  315,
  {desc="Toggle vertical term"}
)
map(
  {"n"},
  "<A-h>",
  332,
  {desc="Toggle horizontal term"}
)
map(
  {"n"},
  "<leader>v",
  354,
  {desc="New vertical term"}
)
map(
  {"n"},
  "<leader>h",
  347,
  {desc="New horizontal term"}
)
map(
  {"n"},
  "<A-i>",
  325,
  {desc="Toggle floating term"}
)
map(
  {"n"},
  "<A-v>",
  339,
  {desc="Toggle vertical term"}
)

------- WHICHKEY -------
map(
  {"n"},
  "<leader>wk",
  373,
  {desc="Which-key query lookup"}
)
map(
  {"n"},
  "<leader>wK",
  367,
  {desc="Which-key all keymaps"}
)

------- NEOGEN -------
map(
  {"n"},
  "<leader>cd",
  92,
  {desc="Class docstring"}
)
map(
  {"n"},
  "<leader>fd",
  84,
  {desc="Function docstring"}
)

------- AUTO_SESSION -------
map(
  {"n"},
  "<leader>fs",
  257,
  {desc="Find session"}
)

------- YANKY -------
map(
  {"x"},
  "y",
  '<Plug>(YankyYank)',
  {desc="Yank"}
)
map(
  {"x"},
  "p",
  '<Plug>(YankyPutAfter)',
  {desc="Put after"}
)
map(
  {"x"},
  "gp",
  '<Plug>(YankyGPutAfter)',
  {desc="Put after and move"}
)
map(
  {"x"},
  "gP",
  '<Plug>(YankyGPutBefore)',
  {desc="Put before and move"}
)
map(
  {"x"},
  "<M-y>",
  309,
  {desc="Last put text object"}
)
map(
  {"x"},
  "P",
  '<Plug>(YankyPutBefore)',
  {desc="Put before"}
)
map(
  {"n"},
  "gp",
  '<Plug>(YankyGPutAfter)',
  {desc="Put after and move"}
)
map(
  {"n"},
  "[P",
  '<Plug>(YankyPutIndentBeforeLinewise)',
  {desc="Put indent before linewise"}
)
map(
  {"n"},
  "<M-p>",
  '<Plug>(YankyPreviousEntry)',
  {desc="Previous yank"}
)
map(
  {"n"},
  ">P",
  '<Plug>(YankyPutIndentBeforeShiftRight)',
  {desc="Put indent before shift right"}
)
map(
  {"n"},
  "p",
  '<Plug>(YankyPutAfter)',
  {desc="Put after"}
)
map(
  {"n"},
  "<P",
  '<Plug>(YankyPutIndentBeforeShiftLeft)',
  {desc="Put indent before shift left"}
)
map(
  {"n"},
  "]P",
  '<Plug>(YankyPutIndentAfterLinewise)',
  {desc="Put indent after linewise"}
)
map(
  {"n"},
  "[p",
  '<Plug>(YankyPutIndentBeforeLinewise)',
  {desc="Put indent before linewise"}
)
map(
  {"n"},
  "<M-y>",
  293,
  {desc="Last put text object"}
)
map(
  {"n"},
  "y",
  '<Plug>(YankyYank)',
  {desc="Yank"}
)
map(
  {"n"},
  "<M-n>",
  '<Plug>(YankyNextEntry)',
  {desc="Next yank"}
)
map(
  {"n"},
  "gP",
  '<Plug>(YankyGPutBefore)',
  {desc="Put before and move"}
)
map(
  {"n"},
  "<p",
  '<Plug>(YankyPutIndentAfterShiftLeft)',
  {desc="Put indent after shift left"}
)
map(
  {"n"},
  "]p",
  '<Plug>(YankyPutIndentAfterLinewise)',
  {desc="Put indent after linewise"}
)
map(
  {"n"},
  "=P",
  '<Plug>(YankyPutBeforeFilter)',
  {desc="Put indent before shift left"}
)
map(
  {"n"},
  "=p",
  '<Plug>(YankyPutAfterFilter)',
  {desc="Put indent before shift right"}
)
map(
  {"n"},
  ">p",
  '<Plug>(YankyPutIndentAfterShiftRight)',
  {desc="Put indent after shift right"}
)
map(
  {"n"},
  "P",
  '<Plug>(YankyPutBefore)',
  {desc="Put before"}
)

------- GITSIGNS -------
map(
  {"n"},
  "<leader>gb",
  453,
  {desc="Blame line"}
)
map(
  {"n"},
  "[c",
  424,
  {desc="Jump to prev hunk"}
)
map(
  {"n"},
  "<leader>rh",
  439,
  {desc="Reset hunk"}
)
map(
  {"n"},
  "]c",
  410,
  {desc="Jump to next hunk"}
)
map(
  {"n"},
  "<leader>td",
  460,
  {desc="Toggle deleted"}
)
map(
  {"n"},
  "<leader>ph",
  446,
  {desc="Preview hunk"}
)

------- TELESCOPE -------
map(
  {"n"},
  "<leader>ma",
  '<cmd> Telescope marks <CR>',
  {desc="telescope bookmarks"}
)
map(
  {"n"},
  "<leader>fb",
  '<cmd> Telescope buffers <CR>',
  {desc="Find buffers"}
)
map(
  {"n"},
  "<leader>fh",
  '<cmd> Telescope help_tags <CR>',
  {desc="Help page"}
)
map(
  {"n"},
  "<leader>cm",
  '<cmd> Telescope git_commits <CR>',
  {desc="Git commits"}
)
map(
  {"n"},
  "<leader>pt",
  '<cmd> Telescope terms <CR>',
  {desc="Pick hidden term"}
)
map(
  {"n"},
  "<leader>gt",
  '<cmd> Telescope git_status <CR>',
  {desc="Git status"}
)
map(
  {"n"},
  "<leader>fw",
  '<cmd> Telescope live_grep <CR>',
  {desc="Live grep"}
)
map(
  {"n"},
  "<leader>fz",
  '<cmd> Telescope current_buffer_fuzzy_find <CR>',
  {desc="Find in current buffer"}
)
map(
  {"n"},
  "<leader>fo",
  '<cmd> Telescope oldfiles <CR>',
  {desc="Find oldfiles"}
)
map(
  {"n"},
  "<leader>ff",
  '<cmd> Telescope find_files <CR>',
  {desc="Find files"}
)
map(
  {"n"},
  "<leader>fa",
  '<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>',
  {desc="Find all"}
)
map(
  {"n"},
  "<leader>th",
  '<cmd> Telescope themes <CR>',
  {desc="Nvchad themes"}
)
map(
  {"n"},
  "<leader>fy",
  '<cmd> Telescope yank_history <CR>',
  {desc="Yank history"}
)

------- BLACK -------
map(
  {"n"},
  "<leader>kf",
  327,
  {desc="black-> # fmt: off"}
)
map(
  {"n"},
  "<leader>ks",
  334,
  {desc="black-> # fmt: skip"}
)
map(
  {"n"},
  "<leader>kn",
  320,
  {desc="black-> # fmt: on"}
)

------- TABUFLINE -------
map(
  {"n"},
  "<tab>",
  83,
  {desc="Goto next buffer"}
)
map(
  {"n"},
  "<S-tab>",
  90,
  {desc="Goto prev buffer"}
)
map(
  {"n"},
  "<leader>x",
  98,
  {desc="Close buffer"}
)

------- DAPUI -------
map(
  {"n"},
  "<leader>dco",
  202,
  {desc="dapui console"}
)
map(
  {"n"},
  "<leader>dw",
  196,
  {desc="dapui watches"}
)
map(
  {"n"},
  "<leader>dui",
  188,
  {desc="dapui toggle"}
)

------- GENERAL -------
map(
  {"i"},
  "<C-l>",
  '<Right>',
  {desc="Move right"}
)
map(
  {"i"},
  "<C-k>",
  '<Up>',
  {desc="Move up"}
)
map(
  {"i"},
  "<C-e>",
  '<End>',
  {desc="End of line"}
)
map(
  {"i"},
  "<C-b>",
  '<ESC>^i',
  {desc="Beginning of line"}
)
map(
  {"i"},
  "<C-h>",
  '<Left>',
  {desc="Move left"}
)
map(
  {"i"},
  "<C-j>",
  '<Down>',
  {desc="Move down"}
)
map(
  {"x"},
  "p",
  'p:let @+=@0<CR>:let @"=@0<CR>',
  {desc="Dont copy replaced text"}
)
map(
  {"x"},
  "k",
  'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',
  {desc="Move up"}
)
map(
  {"x"},
  "j",
  'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',
  {desc="Move down"}
)
map(
  {"t"},
  "<C-x>",
  58,
  {desc="Escape terminal mode"}
)
map(
  {"n"},
  "<C-k>",
  '<cmd> TmuxNavigateUp<CR>',
  {desc="Window up"}
)
map(
  {"n"},
  "<Esc>",
  '<cmd> noh <CR>',
  {desc="Clear highlights"}
)
map(
  {"n"},
  "<C-j>",
  '<cmd> TmuxNavigateDown<CR>',
  {desc="Window down"}
)
map(
  {"n"},
  "k",
  'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',
  {desc="Move up"}
)
map(
  {"n"},
  "j",
  'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',
  {desc="Move down"}
)
map(
  {"n"},
  "<leader>ch",
  '<cmd> NvCheatsheet <CR>',
  {desc="Mapping cheatsheet"}
)
map(
  {"n"},
  "<C-s>",
  '<cmd> w <CR>',
  {desc="Save file"}
)
map(
  {"n"},
  "<leader>b",
  '<cmd> enew <CR>',
  {desc="New buffer"}
)
map(
  {"n"},
  "<C-l>",
  '<cmd> TmuxNavigateRight<CR>',
  {desc="Window right"}
)
map(
  {"n"},
  "<leader>tt",
  14,
  {desc="toggle transparency"}
)
map(
  {"n"},
  "<leader>rn",
  '<cmd> set rnu! <CR>',
  {desc="Toggle relative number"}
)
map(
  {"n"},
  "<C-p>",
  '<C-I>',
  {desc="Jump to next (<C-i> remap)"}
)
map(
  {"n"},
  "<Up>",
  'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',
  {desc="Move up"}
)
map(
  {"n"},
  "<C-h>",
  '<cmd> TmuxNavigateLeft<CR>',
  {desc="Window left"}
)
map(
  {"n"},
  "<Down>",
  'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',
  {desc="Move down"}
)
map(
  {"n"},
  "<leader>n",
  '<cmd> set nu! <CR>',
  {desc="Toggle line number"}
)
map(
  {"n"},
  "<C-c>",
  '<cmd> %y+ <CR>',
  {desc="Copy whole file"}
)
map(
  {"n"},
  "<leader>fm",
  50,
  {desc="LSP formatting"}
)
map(
  {"v"},
  "<leader>fm",
  25,
  {desc="LSP formatting"}
)
map(
  {"v"},
  "<Down>",
  'v:count || mode(1)[0:1] == "no" ? "j" : "gj"',
  {desc="Move down"}
)
map(
  {"v"},
  "<",
  '<gv',
  {desc="Indent line"}
)
map(
  {"v"},
  "<Up>",
  'v:count || mode(1)[0:1] == "no" ? "k" : "gk"',
  {desc="Move up"}
)
map(
  {"v"},
  ">",
  '>gv',
  {desc="Indent line"}
)

------- BLANKLINE -------
map(
  {"n"},
  "<leader>cc",
  387,
  {desc="Jump to current context"}
)

------- TELESCOPE_DAP -------
map(
  {"n"},
  "<leader>dlb",
  233,
  {desc="List breakpoints"}
)
map(
  {"n"},
  "<Leader>df",
  239,
  {desc="dap frames"}
)


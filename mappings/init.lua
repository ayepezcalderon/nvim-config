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
  function()
    require("Comment.api").toggle.linewise.current()
  end,
  {desc="Toggle comment"}
)

------- TROUBLE -------
map(
  {"n"},
  "<leader>tw",
  function()
    require("trouble").toggle("workspace_diagnostics")
  end,
  {desc="Toggle workspace diagnostics"}
)
map(
  {"n"},
  "<leader>tg",
  function()
    require("trouble").toggle("document_diagnostics")
  end,
  {desc="Toggle document diagnostics"}
)
map(
  {"n"},
  "<leader>tq",
  function()
    require("trouble").toggle("quickfix")
  end,
  {desc="Toggle quickfix"}
)
map(
  {"n"},
  "<leader>tl",
  function()
    require("trouble").toggle("loclist")
  end,
  {desc="Toggle loclist"}
)
map(
  {"n"},
  "<leader>tx",
  function()
    require("trouble").toggle()
  end,
  {desc="Toggle trouble"}
)
map(
  {"n"},
  "<leader>tr",
  function()
    require("trouble").toggle("lsp_references")
  end,
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
  function ()
    require('dap-python').test_method()
  end,
  {desc="Debug python run"}
)

------- DAP -------
map(
  {"n"},
  "<leader>dB",
  function()
    require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: '))
  end,
  {desc="Breakpoint condition"}
)
map(
  {"n"},
  "<Leader>dr",
  function()
    require('dapui').close()
    utils.custom_dap_repl_toggle(false)
  end,
  {desc="dap repl toggle"}
)
map(
  {"n"},
  "<F2>",
  function() require('dap').down() end,
  {desc="dap down"}
)
map(
  {"n"},
  "<Leader>dp",
  function()
    require('dap.ui.widgets').preview()
  end,
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
  function() require('dap').step_out() end,
  {desc="dap step out"}
)
map(
  {"n"},
  "<Leader>lp",
  function()
    require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: '))
  end,
  {desc="Log point"}
)
map(
  {"n"},
  "<F5>",
  function() require('dap').continue() end,
  {desc="dap continue"}
)
map(
  {"n"},
  "<Leader>dcb",
  function()
    require('dap').clear_breakpoints()
  end,
  {desc="dap clear breakpoints"}
)
map(
  {"n"},
  "<F8>",
  function() require('dap').step_into() end,
  {desc="dap step into"}
)
map(
  {"n"},
  "<F12>",
  function() require('dap').terminate() end,
  {desc="dap terminate"}
)
map(
  {"n"},
  "<F4>",
  function() require('dap').run_last() end,
  {desc="dap run last"}
)
map(
  {"n"},
  "<F7>",
  function() require('dap').step_over() end,
  {desc="dap step over"}
)
map(
  {"n"},
  "<Leader>ds",
  function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
    utils.set_buf_easy_close_mappings()
  end,
  {desc="dap scopes"}
)
map(
  {"n"},
  "<F3>",
  function() require('dap').up() end,
  {desc="dap up"}
)
map(
  {"n"},
  "<Leader>dh",
  function()
    require('dap.ui.widgets').hover()
    utils.set_buf_easy_close_mappings()
  end,
  {desc="dap hover"}
)
map(
  {"n"},
  "<Leader>dtc",
  function()
    require('dap').run_to_cursor()
  end,
  {desc="dap run to cursor"}
)

------- WHICHKEY -------
map(
  {"n"},
  "<leader>wk",
  function()
    local input = vim.fn.input "WhichKey: "
    vim.cmd("WhichKey " .. input)
  end,
  {desc="Which-key query lookup"}
)
map(
  {"n"},
  "<leader>wK",
  function()
    vim.cmd "WhichKey"
  end,
  {desc="Which-key all keymaps"}
)

------- NEOGEN -------
map(
  {"n"},
  "<leader>cd",
  function ()
    require("neogen").generate({ type = 'class' })
  end,
  {desc="Class docstring", noremap = true, silent = true}
)
map(
  {"n"},
  "<leader>fd",
  function ()
    require("neogen").generate({ type = 'func' })
  end,
  {desc="Function docstring", noremap = true, silent = true}
)

------- AUTO_SESSION -------
map(
  {"n"},
  "<leader>fs",
  function ()
    require("auto-session.session-lens").search_session()
  end,
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
  function()
    require("yanky.textobj").last_put()
  end,
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
  function()
    require("yanky.textobj").last_put()
  end,
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

------- DAPUI -------
map(
  {"n"},
  "<leader>dco",
  function()
    require("dapui").float_element('console')
  end,
  {desc="dapui console"}
)
map(
  {"n"},
  "<leader>dw",
  function()
    require("dapui").float_element('watches')
  end,
  {desc="dapui watches"}
)
map(
  {"n"},
  "<leader>dui",
  function()
    require('dap').repl.close()
    require("dapui").toggle()
    utils.delayed_dap_controls_refresh()
  end,
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
  {"n", "v"},
  "<leader>fm",
  function()
    vim.lsp.buf.format { async = true }
  end,
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
  function()
    local ok, start = require("indent_blankline.utils").get_current_context(
      vim.g.indent_blankline_context_patterns,
      vim.g.indent_blankline_use_treesitter_scope
    )

    if ok then
      vim.api.nvim_win_set_cursor(vim.api.nvim_get_current_win(), { start, 0 })
      vim.cmd [[normal! _]]
    end
  end,
  {desc="Jump to current context"}
)

------- TELESCOPE_DAP -------
map(
  {"n"},
  "<leader>dlb",
  function()
    require'telescope'.extensions.dap.list_breakpoints{}
  end,
  {desc="List breakpoints"}
)
map(
  {"n"},
  "<Leader>df",
  function()
    require'telescope'.extensions.dap.frames{}
  end,
  {desc="dap frames"}
)


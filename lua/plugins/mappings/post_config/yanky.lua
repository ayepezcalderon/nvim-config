local map = vim.keymap.set

map(
  {"n", "x"},
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
  {"n", "x"},
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
  {"n", "x"},
  "<M-y>",
  function()
    require("yanky.textobj").last_put()
  end,
  {desc="Last put text object"}
)
map(
  {"n", "x"},
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
  {"n", "x"},
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
  {"n", "x"},
  "P",
  '<Plug>(YankyPutBefore)',
  {desc="Put before"}
)
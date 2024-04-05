local cmp = require "cmp"

---------------- OPTS ------------------
local cmp_style = "default" -- default/atom/atom_colored

local field_arrangement = {
  atom = { "kind", "abbr", "menu" },
  atom_colored = { "kind", "abbr", "menu" },
}

local lspkind = require('lspkind')
local formatting_style = {
  -- default fields order i.e completion word + item.kind + item.kind icons
  fields = field_arrangement[cmp_style] or { "abbr", "kind", "menu" },

  format = lspkind.cmp_format({
    -- mode = 'symbol', -- show only symbol annotations
    maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                   -- can also be a function to dynamically calculate max width such as 
                   -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
    ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
    -- show_labelDetails = true, -- show labelDetails in menu. Disabled by default

    -- The function below will be called before any actual modifications from lspkind
    -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
    -- before = function (entry, vim_item)
    --   ...
    --   return vim_item
    -- end
  })
}

local enabled = function()
  local disabled = false
  disabled = disabled or (vim.api.nvim_buf_get_option(0, 'buftype') == 'prompt'
    and not require("cmp_dap").is_dap_buffer())
  disabled = disabled or (vim.fn.reg_recording() ~= '')
  disabled = disabled or (vim.fn.reg_executing() ~= '')
  return not disabled
end

local function border(hl_name)
  return {
    { "╭", hl_name },
    { "─", hl_name },
    { "╮", hl_name },
    { "│", hl_name },
    { "╯", hl_name },
    { "─", hl_name },
    { "╰", hl_name },
    { "│", hl_name },
  }
end

local _opts = {
  completion = {
    completeopt = "menu,menuone",
  },

  window = {
    completion = {
      side_padding = (cmp_style ~= "atom" and cmp_style ~= "atom_colored") and 1 or 0,
      winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None",
      scrollbar = false,
    },
    documentation = {
      border = border "CmpDocBorder",
      winhighlight = "Normal:CmpDoc",
    },
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },

  formatting = formatting_style,

  enabled = enabled,

  mapping = {
    ["<C-p>"] = cmp.mapping.select_prev_item(),
    ["<C-n>"] = cmp.mapping.select_next_item(),
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif require("luasnip").expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif require("luasnip").jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
    { name = "nvim_lua" },
    { name = "path" },
  },
}

if cmp_style ~= "atom" and cmp_style ~= "atom_colored" then
  _opts.window.completion.border = border("CmpBorder")
end

---------------- CONFIG ------------------
local _config = function(_, opts)
  cmp.setup(opts)
  cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
    sources = {
      { name = "dap" },
    },
  })
end

---------------- RETURN ------------------
-- load luasnips + cmp related in insert mode only
return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    -- snippet plugin
    "L3MON4D3/LuaSnip",
    -- autopairing of (){}[] etc
    "windwp/nvim-autopairs",
    -- vs-code like pictograms
    "onsails/lspkind.nvim",
    -- cmp sources plugins
    "saadparwaiz1/cmp_luasnip",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "rcarriga/cmp-dap",
  },
  opts = _opts,
  config = _config
}

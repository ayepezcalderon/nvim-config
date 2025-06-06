---------------- OPTS ------------------
local enable = function()
  local disabled = false
  -- enable in dap buffers
  if package.loaded["cmp_dap"] then
    disabled = disabled
        or (vim.api.nvim_get_option_value("buftype", { buf = 0 }) == "prompt" and not require("cmp_dap").is_dap_buffer())
  else
    disabled = disabled or (vim.api.nvim_get_option_value("buftype", { buf = 0 }) == "prompt")
  end
  -- handle recording
  disabled = disabled or (vim.fn.reg_recording() ~= "")
  disabled = disabled or (vim.fn.reg_executing() ~= "")
  -- disable for comments
  disabled = disabled or require("cmp.config.context").in_treesitter_capture("comment")

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

local cmp_config = require("config")["cmp"]

local completion = {
  completeopt = "menu,menuone",
}
if cmp_config.autocomplete ~= true then
  completion.autocomplete = false
end

local function _opts()
  local cmp = require("cmp")

  return {
    completion = completion,

    performance = {
      max_view_entries = cmp_config.max_view_entries,
    },

    window = {
      completion = {
        side_padding = 1,
        winhighlight = "Normal:CmpPmenu,CursorLine:CmpSel,Search:None",
        scrollbar = false,
        border = border("CmpBorder"),
      },
      -- documentation = {
      --   -- border = border "CmpDocBorder",
      --   winhighlight = "Normal:CmpDoc",
      -- },
    },
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },

    formatting = {
      -- default fields order i.e completion word + item.kind + item.kind icons
      fields = { "abbr", "kind", "menu" },

      format = require("lspkind").cmp_format({
        -- options: 'text', 'text_symbol', 'symbol_text', 'symbol'
        mode = 'symbol', -- show only symbol annotations
        maxwidth = 50,   -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
        -- can also be a function to dynamically calculate max width such as
        -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
        ellipsis_char = "...", -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
        -- show_labelDetails = true, -- show labelDetails in menu. Disabled by default

        -- The function below will be called before any actual modifications from lspkind
        -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
        -- before = function (entry, vim_item)
        --   ...
        --   return vim_item
        -- end
      }),
    },

    enabled = cmp_config.enabled and enable,

    mapping = {
      ["<C-p>"] = cmp.mapping.select_prev_item(),
      ["<C-n>"] = cmp.mapping.select_next_item(),
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      -- ["<C-e>"] = cmp.mapping.close(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm({
        behavior = cmp.ConfirmBehavior.Insert,
        select = true,
      }),
      ["<C-j>"] = cmp.mapping(function()
        if cmp.visible() then
          cmp.select_next_item()
        elseif require("luasnip").expand_or_jumpable() then
          vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
        else
          cmp.complete()
        end
      end, {
        "i",
        "s",
      }),
      ["<C-k>"] = cmp.mapping(function(fallback)
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
end

---------------- CONFIG ------------------
local _config = function(_, opts)
  local cmp = require("cmp")
  cmp.setup(opts)
  cmp.setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
    sources = {
      { name = "dap" },
    },
  })
  -- setup autocomplete for required filetypes
  if type(cmp_config.autocomplete) == "table" then
    cmp.setup.filetype(cmp_config.autocomplete, {
      completion = {
        completeopt = "menu,menuone",
        autocomplete = { require('cmp.types').cmp.TriggerEvent.TextChanged },
      },
    })
  end
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
  },
  opts = _opts,
  config = _config,
}

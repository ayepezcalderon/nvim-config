------- OPTS -------
local _opts = {
  integrations = {
    -- leap = true,
    -- mason = true,
    -- trouble = true,
    -- which_key = true,
    illuminate = {
      enabled = false,
      lsp = false
    },
  },

  no_italic = true,

  custom_highlights = function(colors)
    return {
      LineNr = { fg = 16301462 },
      CursorLineNr = { fg = 14278894 },

      IndentBlanklineChar = { fg = 3684167 },
      IndentBlanklineContextChar = { fg = 4540251 },

      PmenuSel = {
        bg = 11266483,
        fg = 1973549
      },

      CmpBorder = { fg = colors.surface2 },
      CmpPmenu = { bg = 1973549 },
      CmpSel = {
        bold = true,
        cterm = {
          bold = true
        },
        link = "PmenuSel"
      }
    }
  end
}

------- RETURN -------
return {
  "catppuccin/nvim",
  name="catppuccin",
  lazy=false,
  priority=1000,
  opts=_opts,
  config = function (_, opts)
    require("catppuccin").setup(opts)
    vim.cmd("colorscheme " .. vim.g.colorscheme)
  end
}

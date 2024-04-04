--------- OPTS -------------
local actions = require("telescope.actions")
require("trouble")
local trouble = require("trouble.providers.telescope")

local _opts = {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix = "   ",
    selection_caret = "  ",
    entry_prefix = "  ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { "node_modules" },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "truncate" },
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    mappings = {
      n = {
        ["q"] = require("telescope.actions").close,
        ["<c-t>"] = trouble.open_with_trouble,
      },
      i = { ["<c-t>"] = trouble.open_with_trouble },
    },
  },

  extensions_list = {
    "themes",
    "terms",
    "fzf",
    "session-lens",
    "yank_history",
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
}

------------ CONFIG --------------
local function _config(_, opts)
  local telescope = require("telescope")
  telescope.setup(opts)

  -- load extensions
  for _, ext in ipairs(opts.extensions_list) do
    telescope.load_extension(ext)
  end

  -- mappings
  require("plugins.telescope.mappings")
end

------------ RETURN --------------
return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },
  cmd = "Telescope",
  opts = _opts,
  config = _config,
}

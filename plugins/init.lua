--- @type LazySpec
local plugins = {
  {
    'rmagatti/auto-session',
    lazy = false,
    opts = function()
      return require("plugins.auto-session")
    end,
  },

  -- load luasnips + cmp related in insert mode only
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      -- snippet plugin
      "L3MON4D3/LuaSnip",
      -- autopairing of (){}[] etc
      "windwp/nvim-autopairs",
      -- cmp sources plugins
      "saadparwaiz1/cmp_luasnip",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "rcarriga/cmp-dap",
    },
    opts = function ()
      return require("plugins.cmp.opts")
    end,
    config = function (_, opts)
      require("cmp").setup(opts)
      require("plugins.cmp.setup").setup()
    end
  },

  {
    "L3MON4D3/LuaSnip",
    dependencies = "rafamadriz/friendly-snippets",
    opts = function ()
      return require("plugins.luasnip.opts")
    end,
    config = function(_, opts)
      require("plugins.luasnip.setup").setup(opts)
    end,
  },

  {
    "windwp/nvim-autopairs",
    opts = function ()
      return require("plugins.autopairs.opts")
    end,
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)
      require("plugins.autopairs.opts").setup()
    end,
  },

  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    build = ":Copilot auth",
    opts = function ()
      return require("plugins.copilot")
    end
  },

  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function ()
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("plugins.dap-python")
    end,
  },

  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-telescope/telescope-dap.nvim",
    },
    config = function ()
      require("custom.dap").color_hls()
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    -- dependencies = "mfussenegger/nvim-dap",
    config = function ()
      require("dapui").setup()
      require("plugins.dapui").load_repl_controls(true, false)
    end,
  },

  {
    "theHamsta/nvim-dap-virtual-text",
    opts = {},
  },

  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function ()
      require("plugins.leap")
    end,
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
          -- Configuration here, or leave empty to use defaults
      })
    end
  },

  {
    "jackMort/ChatGPT.nvim",
    event = "VeryLazy",
    config = function()
      require("chatgpt").setup(
        -- api key as OPENAI_API_KEY (encrypted)environment variable, so api_key_cmd not used
      )
    end,
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim"
    }
  },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    ft = {'python', 'lua'},
    config = function (_, opts)
      require("trouble").setup(opts)
    end
  },

  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter", { "nvim-telescope/telescope-fzf-native.nvim", build = "make" } },
    cmd = "Telescope",
    opts = function ()
      return require("plugins.telescope")
    end,
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)

      -- load extensions
      for _, ext in ipairs(opts.extensions_list) do
        telescope.load_extension(ext)
      end
    end,
  },

  {
    "tpope/vim-repeat",
    lazy = false,
  },

  {
    "lewis6991/gitsigns.nvim",
    dependencies = "tpope/vim-fugitive",
    ft = { "gitcommit", "diff" },
    init = function ()
      require("plugins.gitsigns._init").init()
    end,
    opts = function ()
      return require("plugins.gitsigns.opts")
    end,
    config = function(_, opts)
      require("gitsigns").setup(opts)
    end,
  },

  {
    "tpope/vim-fugitive",
  },

  {{
    "RRethy/vim-illuminate",
    lazy = false,
    opts = {
      delay = 100,
      large_file_cutoff = 2000,
      large_file_overrides = {
        providers = { "lsp" },
      },
    },
    config = function(_, opts)
      require("illuminate").configure(opts)

      local function map(key, dir, buffer)
        vim.keymap.set("n", key, function()
          require("illuminate")["goto_" .. dir .. "_reference"](false)
        end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
      end

      map("]]", "next")
      map("[[", "prev")

      -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
      vim.api.nvim_create_autocmd("FileType", {
        callback = function()
          local buffer = vim.api.nvim_get_current_buf()
          map("]]", "next", buffer)
          map("[[", "prev", buffer)
        end,
      })
    end,
    -- keys = {
    --   { "]]", desc = "Next Reference" },
    --   { "[[", desc = "Prev Reference" },
    -- },
  },
    "RRethy/vim-illuminate",
    ft = {"python", "lua"},
    -- config = function()
    --   -- Use highlight set by by LSP instead of the default 'underline'
    --   vim.api.nvim_set_hl(0, "IlluminatedWordText", { link = "LspReferenceText" })
    --   vim.api.nvim_set_hl(0, "IlluminatedWordRead", { link = "LspReferenceRead" })
    --   vim.api.nvim_set_hl(0, "IlluminatedWordWrite", { link = "LspReferenceWrite" })
    -- end
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
  {
    "nvim-telescope/telescope-dap.nvim",
    config = function ()
      require("core.utils").load_mappings("telescope_dap")
    end
  },
  {
    "nvimtools/none-ls.nvim",
    ft = {"python", "tex", "plaintex", "bib"},
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = function ()
      return require("custom.configs.mason")
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function ()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function ()
      return vim.tbl_deep_extend(
        "force",
        require("plugins.configs.treesitter"),
        require("custom.configs.treesitter")
      )
    end
  },
  {
    "danymat/neogen",
    dependencies = "nvim-treesitter/nvim-treesitter",
    ft = {"python", "lua"},
    opts = function()
      return require "custom.configs.neogen"
    end,
    config = function (_, opts)
      require("neogen").setup(opts)
      require("core.utils").load_mappings("neogen")
    end
    -- Uncomment next line if you want to follow only stable versions
    -- version = "*" 
  },
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      require("custom.configs.vimtex")
    end
  },
  {
    "gbprod/yanky.nvim",
    lazy = false,
    opts = function ()
      return require("custom.configs.yanky")
    end,
    config = function(_, opts)
      require("yanky").setup(opts)
      require("core.utils").load_mappings("yanky")
    end
  },
}

return plugins

--- @type LazySpec
local plugins = {
  {
    'rmagatti/auto-session',
    lazy = false,
    opts = function()
      return require("plugins.auto-session").opts
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
      return require("plugins.cmp").opts
    end,
    config = function (_, opts)
      require("plugins.cmp").setup(_, opts)
    end
  },

  {
    "L3MON4D3/LuaSnip",
    dependencies = "rafamadriz/friendly-snippets",
    opts = function ()
      return require("plugins.luasnip").opts
    end,
    config = function(_, opts)
      require("plugins.luasnip").setup(_, opts)
    end,
  },

  {
    "windwp/nvim-autopairs",
    opts = function ()
      return require("plugins.autopairs").opts
    end,
    config = function(_, opts)
      require("plugins.autopairs").setup(_, opts)
    end,
  },

  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    build = ":Copilot auth",
    opts = function ()
      return require("plugins.copilot").opts
    end
  },

  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
    },
    config = function (_, opts)
      require("plugins.dap-python").setup(_, opts)
    end,
  },

  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "theHamsta/nvim-dap-virtual-text",
      "nvim-telescope/telescope-dap.nvim",
    },
    config = function (_, opts)
      require("plugins.dap").setup(_, opts)
    end,
  },

  {
    "rcarriga/nvim-dap-ui",
    -- dependencies = "mfussenegger/nvim-dap",
    config = function (_, opts)
      require("plugins.dapui").setup(_, opts)
    end,
  },

  {
    "theHamsta/nvim-dap-virtual-text",
    config = true,
  },

  {
    "ggandor/leap.nvim",
    lazy = false,
    config = function (_, opts)
      require("plugins.leap").setup(_, opts)
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
      return require("plugins.telescope").opts
    end,
    config = function(_, opts)
      require("plugins.telescope").setup(_, opts)
    end,
  },

  {
    "tpope/vim-repeat",
    lazy = false,
  },

  {
    "lewis6991/gitsigns.nvim",
    dependencies = { "tpope/vim-fugitive" },
    ft = { "gitcommit", "diff" },
    init = function ()
      require("plugins.gitsigns").init()
    end,
    opts = function ()
      return require("plugins.gitsigns").opts
    end,
    config = function(_, opts)
      require("gitsigns").setup(opts)
    end,
  },

  {
    "RRethy/vim-illuminate",
    lazy = false,
    opts = function ()
      return require("plugins.vim-illuminate").opts
    end,
    config = function(_, opts)
      require("plugins.vim-illuminate").setup(_, opts)
    end,
    -- keys = {
    --   { "]]", desc = "Next Reference" },
    --   { "[[", desc = "Prev Reference" },
    -- },
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

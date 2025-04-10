----------- CONFIG ----------
local python_static_checker = "basedpyright"

local semantic_tokens = false

local on_attach = function(client, bufnr)
  -- On demand mappings
  local map_on_demand = require("plugins.lspconfig.mappings")
  local inlay_hint_supported = client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint
  map_on_demand.load(bufnr, inlay_hint_supported)

  if not semantic_tokens and client.supports_method("textDocument/semanticTokens") then
    client.server_capabilities.semanticTokensProvider = nil
  end

  -- use (based)pyright to hover, not ruff
  if client.name == "ruff" then
    client.server_capabilities.hoverProvider = false
  end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

local function _config(_, opts)
  local lspconfig = require("lspconfig")

  -- require("plugins.lspconfig.utils.ui")

  -- lspconfig.lua_ls.setup({
  --   on_attach = on_attach,
  --   capabilities = capabilities,
  --
  --   settings = {
  --     Lua = {
  --       diagnostics = {
  --         globals = { "vim" },
  --       },
  --       workspace = {
  --         library = {
  --           [vim.fn.expand("$VIMRUNTIME/lua")] = true,
  --           [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
  --           [vim.fn.stdpath("data") .. "/lazy/lazy.nvim/lua/lazy"] = true,
  --         },
  --         maxPreload = 100000,
  --         preloadFileSize = 10000,
  --       },
  --       hint = { enable = true },
  --     },
  --   },
  -- })

  -- if python_static_checker == "pyright" then
  --   lspconfig.pyright.setup({
  --     on_attach = on_attach,
  --     capabilities = capabilities,
  --     filetypes = { "python" },
  --     settings = {
  --       pyright = {
  --         -- Using Ruff's import organizer
  --         disableOrganizeImports = true,
  --       },
  --       -- python = {
  --       --   analysis = {
  --       --     -- Ignore all files for analysis to exclusively use Ruff for linting
  --       --     -- ignore = { '*' },
  --       --   },
  --       -- },
  --     },
  --   })
  -- else
  --   lspconfig.basedpyright.setup({
  --     on_attach = on_attach,
  --     capabilities = capabilities,
  --     filetypes = { "python" },
  --     settings = {
  --       basedpyright = {
  --         -- Using Ruff's import organizer
  --         disableOrganizeImports = true,
  --         analysis = {
  --           typeCheckingMode = "basic",
  --         },
  --       },
  --       -- python = {
  --       --   analysis = {
  --       --     -- Ignore all files for analysis to exclusively use Ruff for linting
  --       --     -- ignore = { '*' },
  --       --   },
  --       -- },
  --     },
  --   })
  -- end

  -- lspconfig.jsonls.setup({
  --   on_attach = on_attach,
  --   capabilities = capabilities,
  -- })
  --
  -- lspconfig.ruff.setup({
  --   on_attach = on_attach,
  --   capabilities = capabilities,
  --   trace = "messages",
  --   init_options = {
  --     settings = {
  --       logLevel = "debug",
  --     },
  --   },
  -- })

  lspconfig.texlab.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = { "tex", "plaintex", "bib" },
    settings = {
      texlab = {
        auxDirectory = ".",
        bibtexFormatter = "texlab",
        build = {
          args = { "-pdf", "-interaction=nonstopmode", "-synctex=1", "%f" },
          executable = "latexmk",
          forwardSearchAfter = true,
          onSave = false,
        },
        chktex = {
          onEdit = false,
          onOpenAndSave = true,
        },
        diagnosticsDelay = 50,
        formatterLineLength = 80,
        forwardSearch = {
          -- -- evince-synctex
          -- args = {"-f", "%l", "%p", "\"code -g %f:%l\""},
          -- executable = "evince-synctex",

          -- okular
          args = { "--unique", "file:%p#src:%l%f" },
          executable = "okular",

          -- -- zathura
          -- args = {"--synctex-forward", "%l:1:%f", "%p"},
          -- executable = "zathura",
        },
        latexFormatter = "texlab",
        latexindent = {
          modifyLineBreaks = false,
        },
      },
    },
  })
  --
  -- lspconfig.textlsp.setup({
  --   on_attach = on_attach,
  --   capabilities = capabilities,
  --   filetypes = { "text", "tex", "org" },
  --   settings = {
  --     textLSP = {
  --       analysers = {
  --         languagetool = {
  --           check_text = {
  --             on_change = false,
  --             on_open = true,
  --             on_save = true
  --           },
  --           enabled = true
  --         }
  --       },
  --       documents = {
  --         org = {
  --           org_todo_keywords = { "TODO", "IN_PROGRESS", "DONE" }
  --         }
  --       }
  --     }
  --   }
  -- })

  -- lspconfig.ltex.setup({
  --   on_attach = on_attach,
  --   capabilities = capabilities,
  -- })

  -- lspconfig.clangd.setup({
  --   on_attach = on_attach,
  --   capabilities = capabilities,
  -- })

  lspconfig.rust_analyzer.setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

----------- RETURN ----------
return {
  "neovim/nvim-lspconfig",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  init = function()
    require("utils.load_plugin").lazy_load("nvim-lspconfig")
  end,
  config = _config,
}

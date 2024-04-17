----------- CONFIG ----------

local semantic_tokens = false

local on_attach = function(client, bufnr)
  -- On demand mappings
  local map_on_demand = require("plugins.lspconfig.mappings")
  map_on_demand.load(bufnr)

  if not semantic_tokens and client.supports_method "textDocument/semanticTokens" then
    client.server_capabilities.semanticTokensProvider = nil
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

  lspconfig.lua_ls.setup {
    on_attach = on_attach,
    capabilities = capabilities,

    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = {
            [vim.fn.expand "$VIMRUNTIME/lua"] = true,
            [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
            [vim.fn.stdpath "data" .. "/lazy/lazy.nvim/lua/lazy"] = true,
          },
          maxPreload = 100000,
          preloadFileSize = 10000,
        },
      },
    },
  }

  lspconfig.pyright.setup({
    on_attach = on_attach,
    capabilities = capabilities,
    filetypes = {"python"},
  })

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
          onOpenAndSave = true
        },
        diagnosticsDelay = 50,
        formatterLineLength = 80,
        forwardSearch = {
          -- -- evince-synctex
          -- args = {"-f", "%l", "%p", "\"code -g %f:%l\""},
          -- executable = "evince-synctex",

          -- okular
          args = {"--unique", "file:%p#src:%l%f"},
          executable = "okular",

          -- -- zathura
          -- args = {"--synctex-forward", "%l:1:%f", "%p"},
          -- executable = "zathura",
        },
        latexFormatter = "texlab",
        latexindent = {
          modifyLineBreaks = false
        }
      }
    }
  })
end

----------- RETURN ----------
return {
  "neovim/nvim-lspconfig",
  init = function()
    require("utils").lazy_load("nvim-lspconfig")
  end,
  config = _config,
}

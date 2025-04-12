local servers = require("config")["lsp"]["servers"]

local on_attach = function(client, bufnr)
  -- On demand mappings
  local map_on_demand = require("plugins.lspconfig.mappings")
  local inlay_hint_supported = client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint
  map_on_demand.load(bufnr, inlay_hint_supported)

  if not servers["semantic_tokens"] and client.supports_method("textDocument/semanticTokens") then
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

local M = {}

M.setup = function()
  -- Default config for all LSP servers
  vim.lsp.config('*', {
    capabilities = capabilities,
    on_attach = on_attach,
    root_markers = { '.git' },
  })

  -- Define diagnostic behavior and visuals
  vim.diagnostic.config({
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = "󰅙",
        [vim.diagnostic.severity.WARN] = "󰋼",
        [vim.diagnostic.severity.INFO] = "󰌵",
        [vim.diagnostic.severity.HINT] = "",
      },
      linehl = {
        -- [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
      },
      numhl = {
        [vim.diagnostic.severity.ERROR] = "ErrorMsg",
        [vim.diagnostic.severity.WARN] = "WarningMsg",
        [vim.diagnostic.severity.INFO] = "InfoMsg",
        [vim.diagnostic.severity.HINT] = "HintMsg",
      },
    },
    -- virtual_text = {
    --   prefix = "",
    --   current_line = true,
    -- },
    virtual_lines = {
      current_line = true,
    },
    underline = true,
    update_in_insert = false,
  })

  -- Enable LSP servers
  vim.lsp.enable({ "basedpyright", "ruff", "lua_ls", "jsonls", "ltex", "clangd", "texlab", "rust_analyzer" })
end

return M

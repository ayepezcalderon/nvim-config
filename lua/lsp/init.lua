local config = require("config")

local M = {}

M.on_init = function(client)
  if not config.lsp.semantic_tokens and client.supports_method("textDocument/semanticTokens") then
    client.server_capabilities.semanticTokensProvider = nil
  end

  -- use (based)pyright to hover, not ruff
  if client.name == "ruff" then
    client.server_capabilities.hoverProvider = false
  end
end

M.on_attach = function(client, bufnr)
  -- On demand mappings
  local map_on_demand = require("lsp.mappings")
  -- local inlay_hint_supported = client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint
  local inlay_hint_supported = true
  map_on_demand.load(bufnr, inlay_hint_supported)

  -- Set format on save
  if config.lsp.format_on_save then
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("FormatOnSave" .. bufnr, { clear = true }),
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ async = false, bufnr = bufnr })
        end,
      })
    end
  end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.textDocument.completion.completionItem = {
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

M.setup = function()
  -- Default config for all LSP servers
  vim.lsp.config('*', {
    on_init = M.on_init,
    capabilities = M.capabilities,
    on_attach = M.on_attach,
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
  vim.lsp.enable(config.lsp.servers)
end

return M

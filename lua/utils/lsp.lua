M = {}

local servers = require("config")["lsp"]["servers"]

M.on_attach = function(client, bufnr)
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

M.get_filename = function()
  local info = debug.getinfo(1, "S")
  local source = info.source

  if source:sub(1, 1) == "@" then
    -- extract filename without extension
    return source:sub(2):match("([^/\\]+)%.lua$")
  end
end

--- Return filetypes corresponding to the server name in the config
---@param server_name string Name of the LSP server
M.get_filetypes = function(server_name)
  local filetypes = {}

  for language, servers_names in pairs(servers) do
    for _, server in ipairs(servers_names) do
      if server == server_name then
        table.insert(filetypes, language)
      end
    end
  end

  return filetypes
end

--------- UTILITIES FROM lspconfig HERE ---------
local validate = vim.validate
local api = vim.api
-- local lsp = vim.lsp
local nvim_eleven = vim.fn.has 'nvim-0.11' == 1

function M.validate_bufnr(bufnr)
  if nvim_eleven then
    validate('bufnr', bufnr, 'number')
  end
  return bufnr == 0 and api.nvim_get_current_buf() or bufnr
end

return M

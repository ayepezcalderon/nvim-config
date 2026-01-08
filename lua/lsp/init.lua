local config = require("config")

local M = {}


local format_on_save = config.lsp.format_on_save
---Toggle format on save
---@param client vim.lsp.Client|nil
local define_format_on_save = function(client)
  -- Get client(s)
  local clients
  if client then
    clients = { client }
  else
    clients = vim.lsp.get_clients({ bufnr = vim.api.nvim_get_current_buf() })
  end

  local bufnr = vim.api.nvim_get_current_buf()

  ---Check if the autocommand for format on save exists
  local function autocommand_exists(group_name)
    local autocmds = vim.api.nvim_get_autocmds({
      group = group_name,
      buffer = bufnr,
    })
    return #autocmds > 0
  end

  -- If format on save is not desired and the autocommand exists, clear it
  if not format_on_save and autocommand_exists("FormatOnSave_" .. bufnr) then
    vim.api.nvim_clear_autocmds({
      group = "FormatOnSave_" .. bufnr,
      buffer = bufnr,
    })
    return
  end

  -- If format on save is desired and the autocommand does not exist, create it
  for _, _client in ipairs(clients) do
    if _client:supports_method("textDocument/formatting") then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = vim.api.nvim_create_augroup("FormatOnSave_" .. bufnr, { clear = true }),
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ async = false, bufnr = bufnr })
        end,
      })
      break
    end
  end
end

vim.api.nvim_create_user_command("FormatOnSaveToggle", function()
  format_on_save = not format_on_save
  print("Format on Save is now " .. (format_on_save and "enabled" or "disabled"))

  define_format_on_save()
end, {})


M.on_init = function(client)
  if not config.lsp.semantic_tokens and client.supports_method("textDocument/semanticTokens") then
    client.server_capabilities.semanticTokensProvider = nil
  end

  -- do not use ruff to hover
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
  define_format_on_save(client)
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
    virtual_lines = config.lsp.virtual_lines,
    underline = true,
    update_in_insert = false,
  })

  -- Enable LSP servers
  vim.lsp.enable(config.lsp.servers)
end

return M

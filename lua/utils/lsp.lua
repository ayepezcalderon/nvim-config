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

local function escape_wildcards(path)
  return path:gsub('([%[%]%?%*])', '\\%1')
end

function M.tbl_flatten(t)
  --- @diagnostic disable-next-line:deprecated
  return nvim_eleven and vim.iter(t):flatten(math.huge):totable() or vim.tbl_flatten(t)
end

-- For zipfile: or tarfile: virtual paths, returns the path to the archive.
-- Other paths are returned unaltered.
function M.strip_archive_subpath(path)
  -- Matches regex from zip.vim / tar.vim
  path = vim.fn.substitute(path, 'zipfile://\\(.\\{-}\\)::[^\\\\].*$', '\\1', '')
  path = vim.fn.substitute(path, 'tarfile:\\(.\\{-}\\)::.*$', '\\1', '')
  return path
end

function M.search_ancestors(startpath, func)
  if nvim_eleven then
    validate('func', func, 'function')
  end
  if func(startpath) then
    return startpath
  end
  local guard = 100
  for path in vim.fs.parents(startpath) do
    -- Prevent infinite recursion if our algorithm breaks
    guard = guard - 1
    if guard == 0 then
      return
    end

    if func(path) then
      return path
    end
  end
end

function M.root_pattern(...)
  local patterns = M.tbl_flatten { ... }
  return function(startpath)
    startpath = M.strip_archive_subpath(startpath)
    for _, pattern in ipairs(patterns) do
      local match = M.search_ancestors(startpath, function(path)
        for _, p in ipairs(vim.fn.glob(table.concat({ escape_wildcards(path), pattern }, '/'), true, true)) do
          if vim.loop.fs_stat(p) then
            return path
          end
        end
      end)

      if match ~= nil then
        return match
      end
    end
  end
end

return M

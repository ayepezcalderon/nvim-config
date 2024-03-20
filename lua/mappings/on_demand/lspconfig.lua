local M = {}

function M.load(buffer)
  -- bind buffer to mapping
  local function map(modes, lhs, rhs, opts)
    opts = vim.tbl_deep_extend(
      "force",
      {buffer = buffer},
      opts
    )
    vim.keymap.set(modes, lhs, rhs, opts)
  end

  -- mappings
  map(
    "n",
    "gD",
    function()
      vim.lsp.buf.declaration()
    end,
    {
      desc = "LSP declaration",
    }
  )

  map(
    "n",
    "gd",
    function()
      vim.lsp.buf.definition()
    end,
    {
      desc = "LSP definition",
    }
  )

  map(
    "n",
    "K",
    function()
      vim.lsp.buf.hover()
    end,
    {
      desc = "LSP hover",
    }
  )

  map(
    "n",
    "gi",
    function()
      vim.lsp.buf.implementation()
    end,
    {
      desc = "LSP implementation",
    }
  )

  map(
    "n",
    "<leader>ls",
    function()
      vim.lsp.buf.signature_help()
    end,
    {
      desc = "LSP signature help",
    }
  )

  map(
    "n",
    "<leader>D",
    function()
      vim.lsp.buf.type_definition()
    end,
    {
      desc = "LSP definition type",
    }
  )

  map(
    {"n", "v"},
    "<leader>ca",
    function()
      vim.lsp.buf.code_action()
    end,
    {
      desc = "LSP code action",
    }
  )

  map(
    "n",
    "gr",
    function()
      vim.lsp.buf.references()
    end,
    {
      desc = "LSP references",
    }
  )

  map(
    "n",
    "<leader>lf",
    function()
      vim.diagnostic.open_float { border = "rounded" }
    end,
    {
      desc = "Floating diagnostic",
    }
  )

  map(
    "n",
    "[d",
    function()
      vim.diagnostic.goto_prev { float = { border = "rounded" } }
    end,
    {
      desc = "Goto prev",
    }
  )

  map(
    "n",
    "]d",
    function()
      vim.diagnostic.goto_next { float = { border = "rounded" } }
    end,
    {
      desc = "Goto next",
    }
  )

  map(
    "n",
    "<leader>q",
    function()
      vim.diagnostic.setloclist()
    end,
    {
      desc = "Diagnostic setloclist",
    }
  )

  map(
    "n",
    "<leader>wa",
    function()
      vim.lsp.buf.add_workspace_folder()
    end,
    {
      desc = "Add workspace folder",
    }
  )

  map(
    "n",
    "<leader>wr",
    function()
      vim.lsp.buf.remove_workspace_folder()
    end,
    {
      desc = "Remove workspace folder",
    }
  )

  map(
    "n",
    "<leader>wl",
    function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end,
    {
      desc = "List workspace folders",
    }
  )
end

return M

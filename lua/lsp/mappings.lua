local M = {}

function M.load(buffer, inlay_hints)
  -- bind buffer to mapping
  local function map(modes, lhs, rhs, opts)
    opts = vim.tbl_deep_extend("force", { buffer = buffer }, opts)
    vim.keymap.set(modes, lhs, rhs, opts)
  end

  -- mappings
  map("n", "gD", function()
    vim.lsp.buf.declaration()
  end, {
    desc = "LSP declaration",
  })

  map("n", "gd", function()
    vim.lsp.buf.definition()
  end, {
    desc = "LSP definition",
  })

  map({ "n", "v" }, "<leader>fm", function()
    vim.lsp.buf.format({ async = true })
  end, { desc = "LSP formatting" })

  if inlay_hints then
    map("n", "<leader>th", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end, {
      desc = "Toggle Inlay Hints",
    })
  end

  map("i", "<C-s>", function()
    -- Close cmp
    if package.loaded["cmp"] then
      local cmp = require("cmp")
      if cmp.visible() then
        cmp.close()
      end
    end
    -- Show signature help
    vim.lsp.buf.signature_help({
      border = "single",
      -- This doesn't work, annoying title
      title = "",
      -- Move to right so that it bothers less
      title_pos = "right",
    })
  end, {
    desc = "LSP signature help",
  })

  map("n", "<leader>D", function()
    vim.lsp.buf.type_definition()
  end, {
    desc = "LSP definition type",
  })

  map("n", "<leader>wa", function()
    vim.lsp.buf.add_workspace_folder()
  end, {
    desc = "Add workspace folder",
  })

  map("n", "<leader>wr", function()
    vim.lsp.buf.remove_workspace_folder()
  end, {
    desc = "Remove workspace folder",
  })

  map("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, {
    desc = "List workspace folders",
  })
end

return M

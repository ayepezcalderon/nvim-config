local M = {}

M.load = function(bufnr)
  local gs = package.loaded.gitsigns

  local function map(mode, l, r, opts)
    opts = opts or {}
    opts.buffer = bufnr
    vim.keymap.set(mode, l, r, opts)
  end

  -- Navigation through hunks
  map("n", "]c", function()
    if vim.wo.diff then
      return "]c"
    end
    vim.schedule(function()
      gs.next_hunk()
    end)
    return "<Ignore>"
  end, {
    expr = true,
    desc = "Jump to next hunk",
  })

  map("n", "[c", function()
    if vim.wo.diff then
      return "[c"
    end
    vim.schedule(function()
      gs.prev_hunk()
    end)
    return "<Ignore>"
  end, {
    expr = true,
    desc = "Jump to prev hunk",
  })

  -- Actions
  map("n", "<leader>hr", gs.reset_hunk, {
    desc = "Hunk reset",
  })
  map("n", "<leader>hs", gs.stage_hunk, {
    desc = "Hunk stage",
  })
  map("v", "<leader>hs", function()
    gs.stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
  end, {
    desc = "Hunk stage",
  })
  map("v", "<leader>hr", function()
    gs.reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
  end, {
    desc = "Hunk reset",
  })
  map("n", "<leader>hu", gs.undo_stage_hunk, {
    desc = "Hunk undo stage",
  })
  map("n", "<leader>hS", gs.stage_buffer, {
    desc = "Buffer stage",
  })
  map("n", "<leader>hR", gs.reset_buffer, {
    desc = "Buffer reset",
  })
  map("n", "<leader>hp", gs.preview_hunk, {
    desc = "Hunk preview",
  })
  map("n", "<leader>hb", function()
    gs.blame_line()
  end, {
    desc = "Blame line",
  })
  map("n", "<leader>hd", gs.diffthis, {
    desc = "Gitsigns diff",
  })
  map("n", "<leader>hD", function()
    gs.diffthis("~")
  end, {
    desc = "Gitsigns diff HEAD~1",
  })
  map("n", "<leader>td", gs.toggle_deleted, {
    desc = "Toggle deleted",
  })

  -- Text object
  map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>")
end

return M

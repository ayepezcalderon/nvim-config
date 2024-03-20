local M = {}

---@param bufnr integer buffer where mappings will be loaded
M.load = function (bufnr)
  local gs = package.loaded.gitsigns

  local function map(mode, l, r, opts)
    opts = opts or {}
    opts.buffer = bufnr
    vim.keymap.set(mode, l, r, opts)
  end

  -- Navigation through hunks
  map('n', ']c', function()
    if vim.wo.diff then return ']c' end
    vim.schedule(function() gs.next_hunk() end)
    return '<Ignore>'
  end, {
      expr = true,
      desc = "Jump to next hunk",
    }
  )

  map('n', '[c', function()
    if vim.wo.diff then return '[c' end
    vim.schedule(function() gs.prev_hunk() end)
    return '<Ignore>'
  end, {
      expr = true,
      desc = "Jump to prev hunk",
    }
  )

  -- Actions
  map('n', '<leader>rh', gs.reset_hunk, {
    desc = "Reset hunk",
  })
  map('n', '<leader>ph', gs.preview_hunk, {
      desc = "Preview hunk",
  })
  map('n', '<leader>gb', function() gs.blame_line() end, {
    desc = "Blame line",
  })
  map('n', '<leader>td', gs.toggle_deleted, {
    desc = "Toggle deleted",
  })
end

return M
